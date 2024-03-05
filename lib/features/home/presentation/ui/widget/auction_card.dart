import 'package:desafio_dixbpo/config/app_extensions.dart';
import 'package:desafio_dixbpo/features/home/data/auction_event.dart';
import 'package:desafio_dixbpo/features/home/presentation/ui/pages/auction_page.dart';
import 'package:flutter/material.dart';

class AuctionCard extends StatelessWidget {
  final AuctionEvent auction;
  const AuctionCard({
    required this.auction,
    super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: const EdgeInsets.all(8),
      decoration: theme.myLightGlassBox,
      child: ListTile(
        title: Text(auction.name),
        subtitle: Text(auction.auctionhouse),
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
            builder: (_)=> AuctionPage(auction: auction))),
      ),
    );
  }
}
