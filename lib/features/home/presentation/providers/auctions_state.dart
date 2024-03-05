
import '../../data/auction_event.dart';

enum AuctionsStatus {empty, loading, loaded}
class AuctionsState{
  List<AuctionEvent> auctions;
  AuctionsStatus status;

  AuctionsState({
    required this.auctions,
    required this.status,
  });

  factory AuctionsState.empty()=> AuctionsState(auctions: [], status: AuctionsStatus.empty);

  AuctionsState copyWith({
    List<AuctionEvent>? auctions,
    AuctionsStatus? status,
  }) {
    return AuctionsState(
      auctions: auctions ?? this.auctions,
      status: status ?? this.status,
    );
  }
}