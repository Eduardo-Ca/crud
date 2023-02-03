import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste/modules/fornecedor/data/models/fornecedor_model.dart';
import 'package:teste/modules/produto/data/models/produto_model.dart';
import 'package:teste/modules/produto/domain/usecases/produto_usecases.dart';
import 'package:teste/modules/produto/presenter/components/text_form_produtos.dart';

class FormEstoque extends StatefulWidget {
  List<ProdutoModel> dropProdutos;
   List<FornecedorModel> dropFornecedor;
   FormEstoque({super.key,required this.dropProdutos,required this.dropFornecedor});

  @override
  State<FormEstoque> createState() => _FormEstoqueState();
}

class _FormEstoqueState extends State<FormEstoque> {

  TextEditingController quantidadeController = TextEditingController();
    String? dropValueProdutos;
    String? dropValueFornecedor;

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
          title: const Text('Novo Estoque'),
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

                        Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: "Escolha o produto",
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                              ),
                              isExpanded: true,
                              icon: const Icon(MdiIcons.zipBox),
                              value: dropValueProdutos,
                              items: widget.dropProdutos
                                  .map((opcao) => DropdownMenuItem(
                                      value: opcao.id, child: Text(opcao.nome)))
                                  .toList(),
                              onChanged: (escolha) =>
                                  dropValueProdutos = escolha.toString()),
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: "Escolha o fornecedor",
                                fillColor: Colors.grey.withOpacity(0.2),
                                filled: true,
                              ),
                              isExpanded: true,
                              icon: const Icon(MdiIcons.humanDolly),
                              value: dropValueFornecedor,
                              items: widget.dropFornecedor
                                  .map((opcao) => DropdownMenuItem(
                                      value: opcao.id, child: Text(opcao.nome)))
                                  .toList(),
                              onChanged: (escolha) =>
                                  dropValueFornecedor= escolha.toString()),
                        ),
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
                        teclado: TextInputType.number,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _UseCasesProduto.criarEstoque(fornecedorId: int.parse(dropValueFornecedor.toString()),produtoId: int.parse(dropValueProdutos.toString()),quantidadeItens:int.parse(quantidadeController.text) );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Criando novo Estoque'),
                              ),
                            );
                           
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
