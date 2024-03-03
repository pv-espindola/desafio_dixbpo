import 'package:desafio_dixbpo/features/auth/presentation/ui/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';

import '../../data/register_form_model.dart';

enum RegisterFormStatus{empty, started, completed}

class RegisterFormState{
  List<ProfileTextfield> form;
  RegisterFormStatus status;
  RegisterFormModel formModel;
  late List<ProfileTextfield> allFields;

 void  loadAllFields(){
    allFields = [
      ProfileTextfield.nome(saving: formModel.loadName,
      validator: validateNome,
      ),
      ProfileTextfield.phone(
        saving: formModel.loadPhone,
        validator: validatePhone,),
      ProfileTextfield.email(
        saving: formModel.loadEmail,
        validator: validateEmail,),
      ProfileTextfield.senha(
        saving: formModel.loadSenha1,
        validator: validateSenha1,),
      ProfileTextfield.retypeSenha(
        saving: formModel.loadSenha2,
        validator: validateSenha2,),

    ];
  }

  RegisterFormState({
    required this.form,
    required this.formModel,
    required this.status,
  }){loadAllFields();}
  factory RegisterFormState.empty() => RegisterFormState(form: [], formModel: RegisterFormModel.empty(), status: RegisterFormStatus.empty);


  RegisterFormState copyWith({
    List<ProfileTextfield>? form,
    RegisterFormStatus? status,
  }) {
    return RegisterFormState(
      form: form ?? this.form,
      status: status ?? this.status,
      formModel: formModel
    );
  }

  String? validateNome(String? value){
    value ??='';
    print('VALIDATE NOME!!');
    if(value.isEmpty){
      return 'Campo Obrigatorio';
    }
    return null;
  }
  String? validatePhone(String? value){
    value ??='';
    if(value.isEmpty){
      return 'Campo Obrigatorio';
    }
    return null;
  }
  String? validateEmail(String? value){
    value ??='';
    bool isValid = value.contains('@') && value.contains('.com');
    if(value.isEmpty){
      return 'Campo Obrigatorio';
    }
    if(!isValid){
      return 'Email inválido';
    }
    return null;
  }
  String? validateSenha1(String? value){
    value ??='';
    if(value.isEmpty){
      return 'Campo Obrigatorio';
    }
    return null;
  }
  String? validateSenha2(String? value){
    value ??='';
    if(value.isEmpty){
      return 'Campo Obrigatorio';
    }
    if(formModel.senha1 != value){
      print('SENHA1 ${formModel.senha1} SENHA 2 ${value}');
      return 'As senhas nao coincidem';
    }
    return null;
  }

}