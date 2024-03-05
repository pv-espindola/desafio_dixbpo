import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_dixbpo/features/home/data/auction_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/auction_image.dart';

class AuctionPage extends StatelessWidget {
  final AuctionEvent auction;
  const AuctionPage({
    required this.auction,
    super.key});
  
  bool get haveImage => auction.image != 'noimage.png';

  @override
  Widget build(BuildContext context) {
    print('AUCTION IMAGE: ${auction.image}');
    
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Placeholder(child: AuctionImage(image: auction.image,)),
            const SizedBox(height: 8,),
            Text('${auction.name}'),
            const SizedBox(height: 8,),
            Text('Telefone: ${auction.phone}'),
            const SizedBox(height: 8,),
            Text('Data: ${auction.date}'),
            const SizedBox(height: 8,),
            Text('Endereço: ${auction.address}'),
          ],
        ),
      ),
    );
  }
}
