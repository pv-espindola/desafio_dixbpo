class RegisterFormModel{
  String nome;
  String phone;
  String email;
  String senha1;
  String senha2;

  RegisterFormModel({
    required this.nome,
    required this.phone,
    required this.email,
    required this.senha1,
    required this.senha2,
  });

  factory RegisterFormModel.empty() => RegisterFormModel(nome:'', phone: '', email: '', senha1: '', senha2: '');

  bool get validSenha => senha1 == senha2;

  loadName(String? value){
    value ??= '';
    print('SAVA NOME $value   !    !');

    nome = value;
  }
  loadEmail(String? value){
    value ??= '';
    email = value;
  }
  loadPhone(String? value){
    value ??= '';
    phone = value;
  }
  loadSenha1(String? value){
    value ??= '';
    senha1 = value;
  }
  loadSenha2(String? value){
    value ??= '';
    senha2 = value;
  }




  RegisterFormModel copyWith({
    String? nome,
    String? phone,
    String? email,
    String? senha1,
    String? senha2,
  }) {
    return RegisterFormModel(
      nome: nome ?? this.nome,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      senha1: senha1 ?? this.senha1,
      senha2: senha2 ?? this.senha2,
    );
  }


}