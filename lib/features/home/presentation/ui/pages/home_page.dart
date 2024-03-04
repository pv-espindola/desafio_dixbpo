import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuctionsProvider auctionsProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auctionsProvider = context.read<AuctionsProvider>();
    auctionsProvider.getListAuctions();
  }
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
