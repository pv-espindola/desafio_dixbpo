
import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_provider.dart';
import 'package:desafio_dixbpo/features/home/presentation/ui/widget/auction_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/auction_event.dart';

enum AuctionsType {online, booked}
class AuctionsList extends StatefulWidget {
  final AuctionsType type;
  const AuctionsList({
    required this.type,
    super.key});

  @override
  State<AuctionsList> createState() => _AuctionsListState();
}

class _AuctionsListState extends State<AuctionsList> {
  late AuctionsProvider auctionsProvider;
  String title ='';
  List<AuctionEvent> auctions=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auctionsProvider = context.read<AuctionsProvider>();
  }
  initAuctionsList(){
    auctionsProvider = context.watch<AuctionsProvider>();
    switch(widget.type){
      case AuctionsType.online:
        auctions = auctionsProvider.onlineAuctions;
        title = 'Leilões Online';
      break;
      case AuctionsType.booked:
        auctions = auctionsProvider.bookedAuctions;
        title = 'Leilões Agendado';
        break;

    }
  }


  @override
  Widget build(BuildContext context) {
    print('$title :${auctions.length}');
    ThemeData theme = Theme.of(context);
    initAuctionsList();


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
        style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: auctions.length,
            itemBuilder: (context, index){
            AuctionEvent auction = auctions[index];
              return AuctionCard(auction: auction);
            }),
      ],
    );
  }
}
