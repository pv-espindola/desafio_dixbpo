import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      centerTitle: true,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(onPressed: (){}, icon: const  Icon(Icons.more_vert)),
        )],
      ),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
