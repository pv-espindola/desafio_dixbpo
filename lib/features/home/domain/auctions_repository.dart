import 'dart:convert';

import 'package:desafio_dixbpo/features/home/data/auction_event.dart';
import 'package:desafio_dixbpo/service/api_service.dart';

import '../../../service/endpoint.dart';

class AuctionsRepository {
  ApiService apiService;

  AuctionsRepository({required this.apiService});

  Future<List<AuctionEvent>> getAll() async {
    List<AuctionEvent> auctions = [];
    var response = await apiService.get(Endpoint.listAuctions);
    print('AUCTIONS RESPONSE CODE: ${response.statusCode}');
    Map<String, dynamic> data =
        json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    List< dynamic> auctionsData = data['data'];
    auctions = List.generate(auctionsData.length,
        (index) => AuctionEvent.fromMap(auctionsData[index]));
    return auctions;
  }
}
