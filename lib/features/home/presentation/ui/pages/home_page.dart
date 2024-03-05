import 'package:desafio_dixbpo/features/auth/presentation/providers/auth_provider.dart';
import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_provider.dart';
import 'package:desafio_dixbpo/features/home/presentation/ui/widget/auctions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widget/menu_buttom.dart';

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
    AuthProvider auth = context.read<AuthProvider>();
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: const [ Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: MenuButton(),
        )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Bem vindo ${auth.state.user?.people.name}',
                style:theme.textTheme.headlineSmall!.copyWith(color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 24,),
              const Flexible(child: AuctionsList(type: AuctionsType.online)),
              const SizedBox(height: 16,),
              const Flexible(child: AuctionsList(type: AuctionsType.booked)),

            ],
          ),
        ),
      ),
    );
  }
}
