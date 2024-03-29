
import 'package:desafio_dixbpo/features/home/presentation/providers/auctions_state.dart';
import 'package:flutter/material.dart';

import '../../data/auction_event.dart';
import '../../domain/auctions_repository.dart';

class AuctionsProvider with ChangeNotifier{
  AuctionsRepository repository;
  AuctionsProvider({required this.repository});

  AuctionsState _state = AuctionsState.empty();
  AuctionsState get state => _state;

  List<AuctionEvent> get onlineAuctions => _state.auctions.where((element) => element.type.isEven).toList();
  List<AuctionEvent> get bookedAuctions => _state.auctions.where((element) => element.type.isOdd).toList();

  void getListAuctions()async {
    _state = _state.copyWith(status: AuctionsStatus.loading);
    notifyListeners();
    List<AuctionEvent> auctions = await repository.getAll();
    _state = _state.copyWith(
      auctions: auctions,
      status: AuctionsStatus.loaded
    );
    notifyListeners();
  }






}