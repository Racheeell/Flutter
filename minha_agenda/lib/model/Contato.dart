import 'dart:ffi';

class Contato {
  //_ significa private

  //Atributos
      int _id;
      String _nome;
      String _email;
      String _celular;

    //Construtor
      Contato(this._nome, this._email, this._celular);

      //metodo que converte de map para  model
      Contato.deMapParaModel(Map<String, dynamic> dados) 
      {
    //this vai receber dados['id'] e armazenar dentro do map

        this._id = dados['id'];
        this._nome = dados['nome'];
        this._email = dados['email'];
        this._celular = dados['celular'];
      }

      //Getter e setter
      int get id => this._id;

      set id(int value) => this._id = value;

      get nome => this._nome;

      set nome(value) => this._nome = value;

      get email => this._email;

      set email(value) => this._email = value;

      get celular => this._celular;

      set celular(value) => this._celular = value;

    //Metodo para converter de Model para map
      Map<String, dynamic> topMap() {
    // 1passo - vou criar um map
        var dados = Map<String, dynamic>();

        dados['id'] = _id;
        dados['nome'] = _nome;
        dados['email'] = _email;
        dados['celular'] = celular;

        return dados;
      }


}
