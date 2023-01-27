import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/produto/presenter/components/text_form_produtos.dart';

class EdicaoProdutos extends StatefulWidget {
  ProdutoModel produto;
  EdicaoProdutos({super.key, required this.produto});

  @override
  State<EdicaoProdutos> createState() => _EdicaoProdutosState();
}

class _EdicaoProdutosState extends State<EdicaoProdutos> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  late UseCasesProduto _UseCasesProduto;

  @override
  void initState() {
    super.initState();

    _UseCasesProduto = GetIt.I.get<UseCasesProduto>();
  }

  bool nomeValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Editando:${widget.produto.nome}'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 650,
              width: 375,
              child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormProdutos(
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira o nome';
                          }
                          return null;
                        },
                        controller: nameController,
                        hintText: " Nome",
                        teclado: TextInputType.name,
                      ),
                      TextFormProdutos(
                        funcao: (value) {
                          if (nomeValidator(value)) {
                            return 'Insira a descrição';
                          }
                          return null;
                        },
                        controller: descricaoController,
                        hintText: "Descrição",
                        teclado: TextInputType.name,
                      ),
                      TextFormProdutos(
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira o preço';
                          }
                          return null;
                        },
                        controller: precoController,
                        hintText: "Preço",
                        teclado: TextInputType.number,
                      ),
                      TextFormProdutos(
                        funcao: (String? value) {
                          if (nomeValidator(value)) {
                            return 'Insira a quantidade';
                          }
                          return null;
                        },
                        controller: quantidadeController,
                        hintText: "Quantidade",
                        teclado: TextInputType.name,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _UseCasesProduto.editarProduto(
                                nome: nameController.text,
                                descricao: descricaoController.text,
                                quantidadeEstoque:
                                    int.parse(quantidadeController.text),
                                precoUnitario:
                                    double.parse(precoController.text),
                                id: widget.produto.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando novo Produto'),
                              ),
                            );
                            print(nameController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Adicionar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
