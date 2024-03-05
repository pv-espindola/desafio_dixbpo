import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AuctionImage extends StatelessWidget {
  final String image;

  const AuctionImage({required this.image, super.key});

  bool get haveImage => image != 'noimage.png';
  final path = 'https://bis365.com.br/bid365/api/v1/';

  @override
  Widget build(BuildContext context) {
    print('$path$image');
    return haveImage
        ? CachedNetworkImage(httpHeaders: const {
            'app': '583f0a5b-c017-4956-b788-a6305767c117',
          }, imageUrl: '$path$image')
        : Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/noimage.jpg',
              fit: BoxFit.cover,
            ),
          );
  }
}
