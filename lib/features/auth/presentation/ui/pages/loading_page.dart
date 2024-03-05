import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Theme.of(context).colorScheme.primary,
      child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(color: Colors.white,)),
    );

  }
}
