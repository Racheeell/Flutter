import 'dart:js';
import 'dart:math';

import 'package:minha_agenda/utils/ContatoHelpers.dart';
import 'package:flutter/material.dart';
import 'package:minha_agenda/model/Contato.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//----------------------------------------------------------------
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtcelular = TextEditingController();

  //Criando List que vamos exibir na tela
  List<Contato> listadecontatos = List<Contato>();

  //O objeto que salva no banco de dados
  ContatoHelpers _db = ContatoHelpers();
  //TextEditingController_descricaoController

  //----------------------------------------------------------------

  //Implementando o matodo para salvar no banco de dados
  void salvarContato({Contato contatoSelecionado}) {
    setState(() async {
      //Verificar se o contatoSelecionado é null ou nao
      //Esta Cadastrando um contato novo
      if (contatoSelecionado == null) {
        //1 Passo - Criar um objeto da classe Contato para guardar as informaçoes
        Contato obj = Contato(txtnome.text, txtemail.text, txtcelular.text);

        int resultado = await _db.insereContato(obj);

        if (resultado != null) {
          print("Cadastrado com Sucesso!!!" + resultado.toString());
        } else {
          print("Erro ao cadastrar!");
        }
      }
      //Caso o objeto contatoSelecionado esteja com dados
      //Alterando um contato existente
      else {
        //  1Passo é armaazenar os dados dos campos de texto e salvar
        //no objeto contatoSelecionado
        contatoSelecionado.nome = txtnome.text;
        contatoSelecionado.email = txtemail.text;
        contatoSelecionado.celular = txtcelular.text;

        //2 PAsso - é chamar o metodo alterar
        int resultado = await _db.alterarCOntato(contatoSelecionado);

        if (resultado != null) {
          print("Dados alterados com Sucesso!" + resultado.toString());
        } else {
          print("Erro ao alterar!");
        }
      }

      txtnome.clear();
      txtemail.clear();
      txtcelular.clear();
    });
  }

//----------------------------------------------------------------
  void recuperarContatos() async {
    //1 Passo - Criar a lista
    List contatosRecuperados = await _db.listarContatos();
    //print("Contatos cadastrados: " + contatosRecuperados.toString());

    List<Contato> listatemporaria = List<Contato>();

    for (var item in contatosRecuperados) {
      Contato c = Contato.deMapParaModel(item);
      listatemporaria.add(c);
    }
    setState(() {
      //transferir tudo que tem na lista temporaria e dps zera ela
      listadecontatos = listatemporaria;
    });
    listatemporaria = null;
  }

//-----------------------------------------------------------------
  void removercontato(int id) async {
    int resultado = await _db.excluirContato(id);

    recuperarContatos();
  }

//-----------------------------------------------------------------
void exibirtelaconfirma(int id)
{
  showDialog(
    context: context,
     builder: context){
       return AlertDialog(
         title: Text("Excluir contato"),
         content: Text("Voce tem certeza que deseja excluir?"),
         backgroundColor: Colors.white,

         actions: <Widget>[
           RaisedButton(
             color: Colors.purple,
             child: Text("Cancelar", style: TextStyle(color: Colors.white),),
             onPressed: (){
               print("Clicou no cancelar");
               Navigator.pop(context);
             },
             ),

             RaisedButton(
               color: Colors.purple,
               child: Text("Sim", style: TextStyle(color: Colors.white),),
               onPressed: (){
                 print("Clicou no sim");
                 removercontato(id);
                 Navigator.pop(context);
               })
         ],
       );
     }
}

//-----------------------------------------------------------------
  void exibirTelaCadastro({Contato contato}) async {
    String textoTitulo = "";
    String textobotao = "";

    //Casdatrando um usuario novo
    if (contato == null) {
      textoTitulo = "Adicionar um Contato";
      textobotao = "Salvar";
    }

    //Alterando os dados de um contato
    else {
      textoTitulo = "Editar um contato";
      textobotao = "Editar";

      //ele pega os dados do contato e mostra para poder alterar
      txtnome.text = contato.nome;
      txtcelular.text = contato.celular;
      txtemail.text = contato.email;
    }
//--------------------------------------------------------
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoTitulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: txtnome,
                  //autofocus = abrir a primeira caixinha o cursor vai estar piscando
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    hintText: "Digite seu Nome",
                  ),
                ),
                TextField(
                  controller: txtemail,
                  //autofocus = abrir a primeira caixinha o cursor vai estar piscando
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    hintText: "Digite seu E-mail",
                  ),
                ),
                TextField(
                  controller: txtcelular,
                  //autofocus = abrir a primeira caixinha o cursor vai estar piscando
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Celular",
                    hintText: "Digite seu numero de celular",
                  ),
                ),
              ],
            ),
//-------------------------------------------------------------------
            //BOTOES

            actions: <Widget>[
              FlatButton(
                child: Text("$textobotao"),
                onPressed: () {
                  salvarContato(contatoSelecionado: contato);
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    recuperarContatos();
  }

  @override
  Widget build(BuildContext context) {
    //Chamamando o metodo recuperarContatos
    //recuperarContatos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Contatos"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: listadecontatos.length,
                  itemBuilder: (context, index) {
                    final Contato obj = listadecontatos[index];

                    return Card(
                      child: ListTile(
                          title: Text(obj.nome),
                          subtitle: Text(obj.celular),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  exibirtelaconfirma(obj.id);
                                  
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.purple,
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  exibirTelaCadastro(contato: obj);
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.purple,
                                    )),
                              )
                            ],
                          )),
                    );
                  }))
        ],
      ),
      //floatingActionButton = botao de adicionar
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            exibirTelaCadastro();
          }),
    );
  }
}
