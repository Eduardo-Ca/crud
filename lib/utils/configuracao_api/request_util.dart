// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste/utils/compartilhados/alerta/alerta.componente.dart';
import 'package:teste/utils/compartilhados/carregando/carregando-alerta.componente.dart';
import 'package:teste/utils/constants/request_constante.dart';

class RequestUtil {
  int? produtoId;
  late Response response;
  int _tentativa = 0;
  bool _isloading = false;
  late Dio dio;
  late String urlBase;

  // 1- criação do objeto dio
  _criarObjDio() async {
  
    String urlBase = "http://172.19.99.124:5000/";

    dio = Dio(BaseOptions(
        connectTimeout: 50000,
        receiveTimeout: 30000,
        baseUrl: urlBase,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        followRedirects: true,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! <= 500;
        }));
  }

  //função para fazer a requisição
  Future<dynamic> fazRequestNovo(
      {required String method,
      required String endpoint,
      required dynamic data,
      bool sincronizando = false,
      BuildContext? context,
      bool loading = false,
      String mensagemErro = '',
      String? mensagemCarregamento,
      dynamic dataParameters}) async {
    endpoint = endpoint;
    dynamic requisicao;
    _isloading = loading;
    await _criarObjDio();
    if (_isloading && context != null) {
      CarregandoAlertaComponente().showCarregar(context,
          mensagemCarregamento: mensagemCarregamento ??
              mensagensCarregamento(context, endpoint, method: method));
    }

    try {
      switch (method.toUpperCase()) {
        case Request.GET:
          requisicao = dio.get(endpoint, queryParameters: data);
          break;
        case Request.POST:
          if (dataParameters == null) {
            requisicao = dio.post(endpoint, data: data);
          } else {
            requisicao =
                dio.post(endpoint, data: data, queryParameters: dataParameters);
          }
          break;
        case Request.PUT:
          if (dataParameters == null) {
            requisicao = dio.put(endpoint, data: data);
          } else {
            requisicao = dio.put(endpoint, data: data, queryParameters: data);
          }
          break;
        case Request.DELETE:
          //requisicao = dio.delete(endpoint, data: data);
          if (dataParameters == null) {
            requisicao = dio.delete(endpoint, data: data);
          } else {
            requisicao = dio.delete(endpoint,
                data: data, queryParameters: dataParameters);
          }

          break;
        default:
          requisicao = dio.get(endpoint, queryParameters: data);
          break;
      }
      response = await requisicao;

      if (response.statusCode == 400) {
        _exibeErros(context);
        print('Erro status: 400');

        if (response.data['erroCodigo'] != null ||
            response.data['erros'] != null) {
          _exibeErros(context);
          return response;
        }
        // debugPrint(response.toString());
        if (_isloading && context != null) {
          CarregandoAlertaComponente().dismissCarregar(context);
        }
        return response;
      } else if (response.statusCode == 500) {
        if (context != null) {
          if (_isloading) CarregandoAlertaComponente().dismissCarregar(context);
          await AlertaComponente()
              .showAlertaErro(context: context, mensagem: "Erro500");
          return response;
        }
        if (_isloading && context != null) {
          CarregandoAlertaComponente().dismissCarregar(context);
        }
        return response;
      } else {
        // debugPrint(response.toString());
        if (_isloading && context != null) {
          CarregandoAlertaComponente().dismissCarregar(context);
        }
        return response;
      }
    } catch (e) {
      if (_isloading && context != null) {
        CarregandoAlertaComponente().dismissCarregar(context);
      }

      if (response.statusCode == Request.UNAUTHORIZED &&
          _tentativa <= Request.QUANTIDADE_TENTATIVAS) {
        _tentativa++;

        return await fazRequestNovo(
            method: method,
            endpoint: endpoint,
            data: data,
            context: context,
            loading: loading,
            mensagemErro: mensagemErro,
            sincronizando: sincronizando);
      }

      return response;
    }
  }

  /// Método que organiza e exibe o(s) erro(s) na tela
  _exibeErros(BuildContext? context) {
    if (context == null) {
      return response;
    }
    if (IterableUtils.isNullOrEmpty(response.data['erros'])) {
      if (_isloading) CarregandoAlertaComponente().dismissCarregar(context);
      AlertaComponente().showAlertaErro(
          context: context, mensagem: response.data['erroCodigo']);
      return response;
    } else {
      List<String> erros = [];
      if (_isloading) CarregandoAlertaComponente().dismissCarregar(context);
      erros.add(response.data['erroCodigo'] + '\n\n');
      response.data['erros'].forEach((erro) {
        String mensagem =
            erro['descricao'] + ':\n' + erro['erroDescricao'] + '\n\n';
        erros.add(mensagem);
      });
      AlertaComponente().showAlertaErros(context: context, erros: erros);
      return response;
    }
  }

  String? mensagensCarregamento(BuildContext context, String endpointRecebido,
      {String? method}) {
    switch (endpointRecebido) {
      default:
        return null;
    }
  }

  /// Realiza a requisição para a API
  ///
  /// É necessário informar o método de requisição com uma simples String,
  /// porém para manter consistência, existe o arquivo de constantes de requests,
  /// que pode ser utilizado da seguinte maneira, usando o método `GET` como exemplo:
  ///
  /// ```dart
  /// RequestUtil().fazRequest(
  ///   method: Request.GET,
  ///   endpoint: 'Path/Endpoint',
  ///   data: {
  ///     'id': 0,
  ///     'descricao': 'teste'
  ///   }
  /// );
  /// ```
  ///
  /// Os parâmetros `endpoint`, que é o endereço que a requisição irá chamar,
  /// e `data`, que são informaçoes requeridas para a requisição, como consultas ou objetos em `JSON`
  /// são necessários também.
  ///
  /// Caso uma requisição não requer `data`, apenas passe como `null`
  ///
}
