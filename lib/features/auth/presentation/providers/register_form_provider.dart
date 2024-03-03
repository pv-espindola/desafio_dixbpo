import 'package:desafio_dixbpo/features/auth/presentation/providers/register_form_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/widgets/profile_textfield.dart';

class RegisterFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  RegisterFormState _state = RegisterFormState.empty();

  RegisterFormState get state => _state;

  int get index => _state.form.length;
  ProfileTextfield get textfield => _state.allFields[index];
  bool get lastField => index == 5;
  String _buttonLabel = 'Proximo';
  String get buttonLabel => _buttonLabel;



  updateState({required RegisterFormStatus status}) {
    _state = _state.copyWith(status: status);
    notifyListeners();
  }

  void start() {
    if (_state.status == RegisterFormStatus.empty) {
      insertNewField(shouldUpdate: false);
      _state = _state.copyWith(status: RegisterFormStatus.started);
    }
  }

  insertNewField({bool? shouldUpdate}){
    if(index == 4){
      _buttonLabel = 'Finalizar';
      notifyListeners();
    }
    _state.form.add(textfield);
    listKey.currentState?.insertItem(_state.form.isNotEmpty? index -1 : 0, duration: const Duration(milliseconds: 1600));
    if(shouldUpdate != null && shouldUpdate) {
      notifyListeners();
    }
  }

  void buttonAction(BuildContext context){
    bool formIsValid = formKey.currentState!.validate();
    if(formIsValid) {
      formKey.currentState!.save();
      if(lastField){

        Navigator.of(context).pop();
        Future.delayed(const Duration(seconds: 2), ()=> _state = RegisterFormState.empty());
        listKey.currentState?.removeAllItems((context, animation) => Container());
        _state = RegisterFormState.empty();
        _buttonLabel = 'Proximo';
      }else {
        insertNewField(shouldUpdate: true);
      }
    }
  }





}
