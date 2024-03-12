import 'package:desafio_dixbpo/features/auth/data/register_form_model.dart';
import 'package:desafio_dixbpo/features/auth/domain/auth_repository.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/providers/register_form_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/widgets/profile_textfield.dart';

class RegisterFormProvider with ChangeNotifier {
  AuthRepository authRepository;

  RegisterFormProvider({required this.authRepository});

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

  insertNewField({bool? shouldUpdate}) {
    if (index == 4) {
      _buttonLabel = 'Finalizar';
      notifyListeners();
    }
    _state.form.add(textfield);
    listKey.currentState?.insertItem(_state.form.isNotEmpty ? index - 1 : 0,
        duration: const Duration(milliseconds: 1600));
    if (shouldUpdate != null && shouldUpdate) {
      notifyListeners();
    }
  }

  Future<bool> createNewUser() async{
    bool isOk = await authRepository.signup(user: _state.formModel);
    return isOk;
  }

  void buttonAction(BuildContext context,
  AuthProvider auth) async {
    bool formIsValid = formKey.currentState!.validate();
    if (formIsValid) {
      formKey.currentState!.save();
      if (lastField) {

        bool isOk = await createNewUser();
        isOk? auth.login2(context, _state.formModel.email, _state.formModel.senha1)
        : print('DEU ERRADO');
        Navigator.of(context).pop();
        Future.delayed(const Duration(seconds: 2), () =>
        _state = RegisterFormState.empty());
        listKey.currentState?.removeAllItems((context, animation) =>
            Container());
        _state = RegisterFormState.empty();
        _buttonLabel = 'Proximo';
      } else {
        insertNewField(shouldUpdate: true);
      }
    }
  }

  void reset(){
    _state = RegisterFormState.empty();
    listKey.currentState?.removeAllItems((context, animation) {

      return Row(
        children: [
          Center(
            child: ScaleTransition(
            scale: animation,
            child: Icon(Icons.delete_forever, size: animation.value * 60,),
            ),
          ),
        ],
      );
    },
    duration: const Duration(milliseconds: 1500)

    );
    _buttonLabel = 'Proximo';
    print('Form resetado!');
  }
}
