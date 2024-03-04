
import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_state.dart';
import 'package:flutter/material.dart';

import '../../data/auction_event.dart';
import '../../domain/auctions_repository.dart';

class AuctionsProvider with ChangeNotifier{
  AuctionsRepository repository;
  AuctionsProvider({required this.repository});

  AuctionsState _state = AuctionsState.empty();
  AuctionsState get state => _state;


  void getListAuctions()async {
    List<AuctionEvent> auctions = await repository.getAll();
    _state = _state.copyWith(
      auctions: auctions,
      status: AuctionsStatus.loaded
    );
    notifyListeners();
  }


}