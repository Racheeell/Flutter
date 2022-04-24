import 'package:minha_agenda/model/Contato.dart';

import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import 'dart:io';

class ContatoHelpers {
// Criar e Conectar ao banco de dados

  static ContatoHelpers _databasehelper;
  static Database _database;

  //Construtor
  ContatoHelpers._createInstace();

  factory ContatoHelpers() {
    if (_databasehelper == null) {
      // verificar se o objeto é nulo
      _databasehelper =
          ContatoHelpers._createInstace(); // se for nula ele cria o objeto
    }
    return _databasehelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }
    return _database;
  }
//------------------------------------------------------------------------
//criar e inicializa o banco de dados
  Future<Database> inicializaBanco() async {
    //Pega o caminho dos Android ou IOS para salvar o banco de dados
    Directory pasta  = await getApplicationDocumentsDirectory();
    String caminho = pasta.path + 'bdcontatos.bd';

    var bancodedados = await openDatabase(caminho,
        version: 1, onCreate: _criaBanco); //abrir bd

    return bancodedados;
  }

//Definindo a Estrutura da Tabela
  String nomeTabela = 'tbl_contato';
  String colId = 'id';
  String colNome = 'nome';
  String colEmail = 'email';
  String colCelular = 'celular';

//---------------------------------------------------------------
  //Metodo que cria a tabela - CRUD da tabela Contato
  //async metodo de tabela mysql
  void _criaBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE $nomeTabela('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colNome Text, '
        '$colEmail Text, '
        '$colCelular Text)');
  }
//----------------------------------------------------------------
  //Metodo que cadastra um contato
  Future<int> insereContato(Contato obj) async {
    //1Passo - Seleciona o banco de dados
    Database db = await this.database;

    var resultado = await db.insert(nomeTabela, obj.topMap());

    return resultado;
  }
//------------------------------------------------------------------
  //Metodo que lista os contatos
  listarContatos() async {
    //1 Passo -- Selecionar o Banco de dados
    Database db = await this.database;

    String sql = "SELECT * FROM $nomeTabela";

    List listaContatos = await db.rawQuery(sql);

    return listaContatos;
  }
//-------------------------------------------------------------------
  //Metodo Excluir
  Future<int> excluirContato(int id) async {
    //1 Passo - Selecionar o banco de dados
    Database db = await this.database;

    var resultado =
        await db.delete(nomeTabela, where: "id = ?", whereArgs: [id]);

    return resultado;
  }
//---------------------------------------------------------------------
  //Metodo Alterar
  Future<int> alterarCOntato(Contato obj) async {
    //1 Passo - Selecionar o banco de dados
    Database db = await this.database;

    var resultado = await db
        .update(nomeTabela, obj.topMap(), where: "id = ?", whereArgs: [obj.id]);

    return resultado;
  }
}
