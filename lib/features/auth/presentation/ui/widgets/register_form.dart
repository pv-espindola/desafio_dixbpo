import 'package:desafio_dixbpo/features/auth/presentation/providers/register_form_provider.dart';
import 'package:desafio_dixbpo/features/auth/presentation/ui/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {


  @override
  void initState() {
    super.initState();

    context.read<RegisterFormProvider>().start();
  }

  @override
  Widget build(BuildContext context) {
    RegisterFormProvider fromProvider = context.watch<RegisterFormProvider>();
    print('REGISTER FORM => ${fromProvider.state.form.length} ');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: fromProvider.formKey,
        child: AnimatedList(
          key: fromProvider.listKey,
          shrinkWrap: true,
            initialItemCount: fromProvider.state.form.length,
            itemBuilder: (context, index, animation){
            ProfileTextfield child = fromProvider.state.form[index];
            FocusNode focusNode = child.focus;
            FocusScope.of(context).requestFocus(focusNode);
            print('REGISTER child => ${child.toString()} ');
              return FadeTransition(
                  opacity: animation,
                  child: child);
            }),
      ),
    );
  }
}
