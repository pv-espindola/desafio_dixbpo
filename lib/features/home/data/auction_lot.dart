import 'package:desafio_dixbpo/features/home/data/lot_image.dart';
import 'package:desafio_dixbpo/features/home/data/lot_last_shot.dart';

class AuctionLot {
  final int id;
  final int type;
  final String name;
  final String description;
  final String age;
  final String? bloodGrade;
  final String? tatRp;
  final String ce;
  final String? coat;
  final String? salesman;
  final String? location;
  final String gender;
  final int quantity;
  final int averageWeight;
  final int isEnabled;
  final int auctionId;
  final int animalFamilyId;
  final int animalCategoryId;
  final int animalBreedId;
  final int initValue;
  final int incValueOne;
  final int incValueTwo;
  final int incValueThree;
  final int incValueFour;
  final int targetBid;
  final int valueA;
  final int valueB;
  final String? disputeTime;
  final String dateInit;
  final String dateEnd;
  final String hourInit;
  final String? hourEnd;
  final String? observation;
  final int status;
  final String paymentForm;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? tradingFloorId;
  final int shotId;
  final String condition;
  final int typeLot;
  final String video;
  final String? genealogy;
  final double valuePerKg;
  final int commission;
  final String valueSold;
  final String totalValue;
  final int acceptProposal;
  final String vlminlance;
  final int viewCount;
  final int? numberParcel;
  final int sequence;
  final String? mother;
  final String? maternalGrandmother;
  final String? maternalGrandfather;
  final String? maternalGreatGrandmother;
  final String? maternalGreatGrandfather;
  final String? father;
  final String? faternalGrandmother;
  final String? faternalGrandfather;
  final String? faternalGreatGrandmother;
  final String? faternalGreatGrandfather;
  final int isLiveTransmission;
  final String? filmingLocation;
  final String? pickupLocation;
  final String? informationReproductive;
  final String? record;
  final String timeCounter;
  final String? dateLimit;
  final String family;
  final String category;
  final String breed;
  final List<LotImage> images;
  final LastShot lastShot;
  final List<dynamic> animals;
  final int? parcelValue;

  AuctionLot({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.age,
    required this.ce,
    required this.gender,
    required this.quantity,
    required this.averageWeight,
    required this.isEnabled,
    required this.auctionId,
    required this.animalFamilyId,
    required this.animalCategoryId,
    required this.animalBreedId,
    required this.initValue,
    required this.incValueOne,
    required this.incValueTwo,
    required this.incValueThree,
    required this.incValueFour,
    required this.targetBid,
    required this.valueA,
    required this.valueB,
    required this.dateInit,
    required this.dateEnd,
    required this.hourInit,
    required this.status,
    required this.paymentForm,
    required this.createdAt,
    required this.updatedAt,
    required this.shotId,
    required this.condition,
    required this.typeLot,
    required this.video,
    required this.valuePerKg,
    required this.commission,
    required this.valueSold,
    required this.totalValue,
    required this.acceptProposal,
    required this.vlminlance,
    required this.viewCount,
    required this.numberParcel,
    required this.sequence,
    required this.timeCounter,
    required this.family,
    required this.category,
    required this.breed,
    required this.images,
    required this.lastShot,
    required this.animals,
    required this.parcelValue,
    this.genealogy,
    this.bloodGrade,
    this.tatRp,
    this.coat,
    this.salesman,
    this.location,
    this.disputeTime,
    this.hourEnd,
    this.observation,
    this.tradingFloorId,
    this.mother,
    this.maternalGrandmother,
    this.maternalGrandfather,
    this.maternalGreatGrandmother,
    this.maternalGreatGrandfather,
    this.father,
    this.faternalGrandmother,
    this.faternalGrandfather,
    this.faternalGreatGrandmother,
    this.faternalGreatGrandfather,
    this.isLiveTransmission = 0,
    this.filmingLocation,
    this.pickupLocation,
    this.informationReproductive,
    this.record,
    this.dateLimit,
  });

  factory AuctionLot.fromMap(Map<String, dynamic> map) {
    List<dynamic> imagesData = map['images'] ?? [];
    List<LotImage> images = List<LotImage>.generate(imagesData.length, (index)=> LotImage.fromMap(imagesData[index]));
    var valuePKgData = map['value_per_kg'];
    double valuePerKilo = valuePKgData.runtimeType == double? valuePKgData : valuePKgData.toDouble() ;
    return AuctionLot(
      id: map['id'],
      type: map['type'],
      name: map['name'],
      description: map['description'],
      age: map['age'],
      bloodGrade: map['blood_grade'],
      tatRp: map['tat_rp'],
      ce: map['ce'],
      coat: map['coat'],
      salesman: map['salesman'],
      location: map['location'],
      gender: map['gender'],
      quantity: map['quantity'],
      averageWeight: map['average_weight'],
      isEnabled: map['is_enabled'],
      auctionId: map['auction_id'],
      animalFamilyId: map['animal_family_id'],
      animalCategoryId: map['animal_category_id'],
      animalBreedId: map['animal_breed_id'],
      initValue: map['init_value'],
      incValueOne: map['inc_value_one'],
      incValueTwo: map['inc_value_two'],
      incValueThree: map['inc_value_three'],
      incValueFour: map['inc_value_four'],
      targetBid: map['target_bid'],
      valueA: map['value_a'],
      valueB: map['value_b'],
      disputeTime: map['dispute_time'],
      dateInit: map['date_init'],
      dateEnd: map['date_end'],
      hourInit: map['hour_init'],
      hourEnd: map['hour_end'],
      observation: map['observation'],
      status: map['status'],
      paymentForm: map['payment_form'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      tradingFloorId: map['trading_floor_id'],
      shotId: map['shot_id'],
      condition: map['condition'],
      typeLot: map['type_lot'],
      video: map['video'],
      genealogy: map['genealogy'],
      valuePerKg: valuePerKilo,
      commission: map['commission'],
      valueSold: map['value_sold'],
      totalValue: map['total_value'],
      acceptProposal: map['accept_proposal'],
      vlminlance: map['vlminlance'],
      viewCount: map['view_count'],
      numberParcel: map['number_parcel'],
      sequence: map['sequence'],
      mother: map['mother'],
      maternalGrandmother: map['maternal_grandmother'],
      maternalGrandfather: map['maternal_grandfather'],
      maternalGreatGrandmother: map['maternal_great_grandmother'],
      maternalGreatGrandfather: map['maternal_great_grandfather'],
      father: map['father'],
      faternalGrandmother: map['faternal_grandmother'],
      faternalGrandfather: map['faternal_grandfather'],
      faternalGreatGrandmother: map['faternal_great_grandmother'],
      faternalGreatGrandfather: map['faternal_great_grandfather'],
      isLiveTransmission: map['is_live_transmission'] ?? 0,
      filmingLocation: map['filming_location'],
      pickupLocation: map['pickup_location'],
      informationReproductive: map['information_reproductive'],
      record: map['record'],
      timeCounter: map['time_counter'],
      dateLimit: map['date_limit'],
      family: map['family'],
      category: map['category'],
      breed: map['breed'],
      images: images,
      lastShot: LastShot.fromMap(map['last_shot']),
      animals: List<dynamic>.from(map['animals'] ?? []),
      parcelValue: map['parcel_value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'description': description,
      'age': age,
      'blood_grade': bloodGrade,
      'tat_rp': tatRp,
      'ce': ce,
      'coat': coat,
      'salesman': salesman,
      'location': location,
      'gender': gender,
      'quantity': quantity,
      'average_weight': averageWeight,
      'is_enabled': isEnabled,
      'auction_id': auctionId,
      'animal_family_id': animalFamilyId,
      'animal_category_id': animalCategoryId,
      'animal_breed_id': animalBreedId,
      'init_value': initValue,
      'inc_value_one': incValueOne,
      'inc_value_two': incValueTwo,
      'inc_value_three': incValueThree,
      'inc_value_four': incValueFour,
      'target_bid': targetBid,
      'value_a': valueA,
      'value_b': valueB,
      'dispute_time': disputeTime,
      'date_init': dateInit,
      'date_end': dateEnd,
      'hour_init': hourInit,
      'hour_end': hourEnd,
      'observation': observation,
      'status': status,
      'payment_form': paymentForm,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'trading_floor_id': tradingFloorId,
      'shot_id': shotId,
      'condition': condition,
      'type_lot': typeLot,
      'video': video,
      'genealogy': genealogy,
      'value_per_kg': valuePerKg,
      'commission': commission,
      'value_sold': valueSold,
      'total_value': totalValue,
      'accept_proposal': acceptProposal,
      'vlminlance': vlminlance,
      'view_count': viewCount,
      'number_parcel': numberParcel,
      'sequence': sequence,
      'mother': mother,
      'maternal_grandmother': maternalGrandmother,
      'maternal_grandfather': maternalGrandfather,
      'maternal_great_grandmother': maternalGreatGrandmother,
      'maternal_great_grandfather': maternalGreatGrandfather,
      'father': father,
      'faternal_grandmother': faternalGrandmother,
      'faternal_grandfather': faternalGrandfather,
      'faternal_great_grandmother': faternalGreatGrandmother,
      'faternal_great_grandfather': faternalGreatGrandfather,
      'is_live_transmission': isLiveTransmission,
      'filming_location': filmingLocation,
      'pickup_location': pickupLocation,
      'information_reproductive': informationReproductive,
      'record': record,
      'time_counter': timeCounter,
      'date_limit': dateLimit,
      'family': family,
      'category': category,
      'breed': breed,
      'images': images,
      'last_shot': lastShot,
      'animals': animals,
      'parcel_value': parcelValue,
    };
  }

  AuctionLot copyWith({
    int? id,
    int? type,
    String? name,
    String? description,
    String? age,
    String? bloodGrade,
    String? tatRp,
    String? ce,
    String? coat,
    String? salesman,
    String? location,
    String? gender,
    int? quantity,
    int? averageWeight,
    int? isEnabled,
    int? auctionId,
    int? animalFamilyId,
    int? animalCategoryId,
    int? animalBreedId,
    int? initValue,
    int? incValueOne,
    int? incValueTwo,
    int? incValueThree,
    int? incValueFour,
    int? targetBid,
    int? valueA,
    int? valueB,
    String? disputeTime,
    String? dateInit,
    String? dateEnd,
    String? hourInit,
    String? hourEnd,
    String? observation,
    int? status,
    String? paymentForm,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? tradingFloorId,
    int? shotId,
    String? condition,
    int? typeLot,
    String? video,
    String? genealogy,
    double? valuePerKg,
    int? commission,
    String? valueSold,
    String? totalValue,
    int? acceptProposal,
    String? vlminlance,
    int? viewCount,
    int? numberParcel,
    int? sequence,
    String? mother,
    String? maternalGrandmother,
    String? maternalGrandfather,
    String? maternalGreatGrandmother,
    String? maternalGreatGrandfather,
    String? father,
    String? faternalGrandmother,
    String? faternalGrandfather,
    String? faternalGreatGrandmother,
    String? faternalGreatGrandfather,
    int? isLiveTransmission,
    String? filmingLocation,
    String? pickupLocation,
    String? informationReproductive,
    String? record,
    String? timeCounter,
    String? dateLimit,
    String? family,
    String? category,
    String? breed,
    List<LotImage>? images,
    LastShot? lastShot,
    List<dynamic>? animals,
    int? parcelValue,
  }) {
    return AuctionLot(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      age: age ?? this.age,
      bloodGrade: bloodGrade ?? this.bloodGrade,
      tatRp: tatRp ?? this.tatRp,
      ce: ce ?? this.ce,
      coat: coat ?? this.coat,
      salesman: salesman ?? this.salesman,
      location: location ?? this.location,
      gender: gender ?? this.gender,
      quantity: quantity ?? this.quantity,
      averageWeight: averageWeight ?? this.averageWeight,
      isEnabled: isEnabled ?? this.isEnabled,
      auctionId: auctionId ?? this.auctionId,
      animalFamilyId: animalFamilyId ?? this.animalFamilyId,
      animalCategoryId: animalCategoryId ?? this.animalCategoryId,
      animalBreedId: animalBreedId ?? this.animalBreedId,
      initValue: initValue ?? this.initValue,
      incValueOne: incValueOne ?? this.incValueOne,
      incValueTwo: incValueTwo ?? this.incValueTwo,
      incValueThree: incValueThree ?? this.incValueThree,
      incValueFour: incValueFour ?? this.incValueFour,
      targetBid: targetBid ?? this.targetBid,
      valueA: valueA ?? this.valueA,
      valueB: valueB ?? this.valueB,
      disputeTime: disputeTime ?? this.disputeTime,
      dateInit: dateInit ?? this.dateInit,
      dateEnd: dateEnd ?? this.dateEnd,
      hourInit: hourInit ?? this.hourInit,
      hourEnd: hourEnd ?? this.hourEnd,
      observation: observation ?? this.observation,
      status: status ?? this.status,
      paymentForm: paymentForm ?? this.paymentForm,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tradingFloorId: tradingFloorId ?? this.tradingFloorId,
      shotId: shotId ?? this.shotId,
      condition: condition ?? this.condition,
      typeLot: typeLot ?? this.typeLot,
      video: video ?? this.video,
      genealogy: genealogy ?? this.genealogy,
      valuePerKg: valuePerKg ?? this.valuePerKg,
      commission: commission ?? this.commission,
      valueSold: valueSold ?? this.valueSold,
      totalValue: totalValue ?? this.totalValue,
      acceptProposal: acceptProposal ?? this.acceptProposal,
      vlminlance: vlminlance ?? this.vlminlance,
      viewCount: viewCount ?? this.viewCount,
      numberParcel: numberParcel ?? this.numberParcel,
      sequence: sequence ?? this.sequence,
      mother: mother ?? this.mother,
      maternalGrandmother: maternalGrandmother ?? this.maternalGrandmother,
      maternalGrandfather: maternalGrandfather ?? this.maternalGrandfather,
      maternalGreatGrandmother:
      maternalGreatGrandmother ?? this.maternalGreatGrandmother,
      maternalGreatGrandfather:
      maternalGreatGrandfather ?? this.maternalGreatGrandfather,
      father: father ?? this.father,
      faternalGrandmother: faternalGrandmother ?? this.faternalGrandmother,
      faternalGrandfather: faternalGrandfather ?? this.faternalGrandfather,
      faternalGreatGrandmother:
      faternalGreatGrandmother ?? this.faternalGreatGrandmother,
      faternalGreatGrandfather:
      faternalGreatGrandfather ?? this.faternalGreatGrandfather,
      isLiveTransmission: isLiveTransmission ?? this.isLiveTransmission,
      filmingLocation: filmingLocation ?? this.filmingLocation,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      informationReproductive:
      informationReproductive ?? this.informationReproductive,
      record: record ?? this.record,
      timeCounter: timeCounter ?? this.timeCounter,
      dateLimit: dateLimit ?? this.dateLimit,
      family: family ?? this.family,
      category: category ?? this.category,
      breed: breed ?? this.breed,
      images: images ?? this.images,
      lastShot: lastShot ?? this.lastShot,
      animals: animals ?? this.animals,
      parcelValue: parcelValue ?? this.parcelValue,
    );
  }
}