import 'package:desafio_dixbpo/features/home/data/auction_lot.dart';

class AuctionEvent {
  final int id;
  final String name;
  final String description;
  final String date;
  final String time;
  final int? isOnline;
  final int type;
  final String contact;
  final String? streaming;
  final String? link;
  final String address;
  final String? zipCode;
  final String image;
  final String? video;
  final String? buttonText;
  final String? catalog;
  final String? regulation;
  final int isEnabled;
  final int isFeatured;
  final int auctionHouseId;
  final int cityId;
  final String? player;
  final String? local;
  final int status;
  final String phone;
  final String deskOne;
  final String? deskTwo;
  final String? deskThree;
  final String? deskFour;
  final String? deskFive;
  final String? deskSix;
  final String? deskSeven;
  final String? deskEight;
  final int tenantId;
  final String createdAt;
  final String updatedAt;
  final String? freePhone;
  final String? website;
  final String? landline;
  final String? contactDeskOne;
  final String? contactDeskTwo;
  final String? contactDeskThree;
  final String? contactDeskFour;
  final String? contactDeskFive;
  final String? contactDeskSix;
  final String? contactDeskSeven;
  final String? contactDeskEight;
  final String? hourEnd;
  final String? dateLimit;
  final int viewCount;
  final int watchesCount;
  final String auctioneer;
  final String auctionhouse;
  final String city;
  final String? catalogUrl;
  final List<String> banners;
  final List<AuctionLot> lots;
  final List<String> contents;
  final List<String> desks;
  final List<String> contactDesks;

  AuctionEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    this.isOnline,
    required this.type,
    required this.contact,
    this.streaming,
    this.link,
    required this.address,
    this.zipCode,
    required this.image,
    this.video,
    this.buttonText,
    this.catalog,
    this.regulation,
    required this.isEnabled,
    required this.isFeatured,
    required this.auctionHouseId,
    required this.cityId,
    this.player,
    this.local,
    required this.status,
    required this.phone,
    required this.deskOne,
    this.deskTwo,
    this.deskThree,
    this.deskFour,
    this.deskFive,
    this.deskSix,
    this.deskSeven,
    this.deskEight,
    required this.tenantId,
    required this.createdAt,
    required this.updatedAt,
    this.freePhone,
    this.website,
    this.landline,
    this.contactDeskOne,
    this.contactDeskTwo,
    this.contactDeskThree,
    this.contactDeskFour,
    this.contactDeskFive,
    this.contactDeskSix,
    this.contactDeskSeven,
    this.contactDeskEight,
    this.hourEnd,
    this.dateLimit,
    required this.viewCount,
    required this.watchesCount,
    required this.auctioneer,
    required this.auctionhouse,
    required this.city,
    this.catalogUrl,
    required this.banners,
    required this.lots,
    required this.contents,
    required this.desks,
    required this.contactDesks,
  });

  factory AuctionEvent.fromMap(Map<String, dynamic> map) {
    List<dynamic> lotData = map['lots'] ?? [];
    List<AuctionLot> lots = List<AuctionLot>.generate(lotData.length, (index) => AuctionLot.fromMap(lotData[index]));
    return AuctionEvent(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      isOnline: map['is_online'],
      type: map['type'],
      contact: map['contact'],
      streaming: map['streaming'],
      link: map['link'],
      address: map['address'],
      zipCode: map['zip_code'],
      image: map['image'],
      video: map['video'],
      buttonText: map['button_text'],
      catalog: map['catalog'],
      regulation: map['regulation'],
      isEnabled: map['is_enabled'],
      isFeatured: map['is_featured'],
      auctionHouseId: map['auction_house_id'],
      cityId: map['city_id'],
      player: map['player'],
      local: map['local'],
      status: map['status'],
      phone: map['phone'],
      deskOne: map['desk_one'],
      deskTwo: map['desk_two'],
      deskThree: map['desk_three'],
      deskFour: map['desk_four'],
      deskFive: map['desk_five'],
      deskSix: map['desk_six'],
      deskSeven: map['desk_seven'],
      deskEight: map['desk_eight'],
      tenantId: map['tenant_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      freePhone: map['free_phone'],
      website: map['website'],
      landline: map['landline'],
      contactDeskOne: map['contact_desk_one'],
      contactDeskTwo: map['contact_desk_two'],
      contactDeskThree: map['contact_desk_three'],
      contactDeskFour: map['contact_desk_four'],
      contactDeskFive: map['contact_desk_five'],
      contactDeskSix: map['contact_desk_six'],
      contactDeskSeven: map['contact_desk_seven'],
      contactDeskEight: map['contact_desk_eight'],
      hourEnd: map['hour_end'],
      dateLimit: map['date_limit'],
      viewCount: map['view_count'],
      watchesCount: map['watches_count'],
      auctioneer: map['auctioneer'] ?? '',
      auctionhouse: map['auctionhouse'],
      city: map['city'],
      catalogUrl: map['catalog_url'],
      banners: List<String>.from(map['banners'] ?? []),
      lots: lots,
      contents: [],
      desks: List<String>.from(map['desks'] ?? []),
      contactDesks: List<String>.from(map['contact_desks'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'is_online': isOnline,
      'type': type,
      'contact': contact,
      'streaming': streaming,
      'link': link,
      'address': address,
      'zip_code': zipCode,
      'image': image,
      'video': video,
      'button_text': buttonText,
      'catalog': catalog,
      'regulation': regulation,
      'is_enabled': isEnabled,
      'is_featured': isFeatured,
      'auction_house_id': auctionHouseId,
      'city_id': cityId,
      'player': player,
      'local': local,
      'status': status,
      'phone': phone,
      'desk_one': deskOne,
      'desk_two': deskTwo,
      'desk_three': deskThree,
      'desk_four': deskFour,
      'desk_five': deskFive,
      'desk_six': deskSix,
      'desk_seven': deskSeven,
      'desk_eight': deskEight,
      'tenant_id': tenantId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'free_phone': freePhone,
      'website': website,
      'landline': landline,
      'contact_desk_one': contactDeskOne,
      'contact_desk_two': contactDeskTwo,
      'contact_desk_three': contactDeskThree,
      'contact_desk_four': contactDeskFour,
      'contact_desk_five': contactDeskFive,
      'contact_desk_six': contactDeskSix,
      'contact_desk_seven': contactDeskSeven,
      'contact_desk_eight': contactDeskEight,
      'hour_end': hourEnd,
      'date_limit': dateLimit,
      'view_count': viewCount,
      'watches_count': watchesCount,
      'auctioneer': auctioneer,
      'auctionhouse': auctionhouse,
      'city': city,
      'catalog_url': catalogUrl,
      'banners': banners,
      'lots': lots,
      'contents': contents,
      'desks': desks,
      'contact_desks': contactDesks,
    };
  }

  AuctionEvent copyWith({
    int? id,
    String? name,
    String? description,
    String? date,
    String? time,
    int? isOnline,
    int? type,
    String? contact,
    String? streaming,
    String? link,
    String? address,
    String? zipCode,
    String? image,
    String? video,
    String? buttonText,
    String? catalog,
    String? regulation,
    int? isEnabled,
    int? isFeatured,
    int? auctionHouseId,
    int? cityId,
    String? player,
    String? local,
    int? status,
    String? phone,
    String? deskOne,
    String? deskTwo,
    String? deskThree,
    String? deskFour,
    String? deskFive,
    String? deskSix,
    String? deskSeven,
    String? deskEight,
    int? tenantId,
    String? createdAt,
    String? updatedAt,
    String? freePhone,
    String? website,
    String? landline,
    String? contactDeskOne,
    String? contactDeskTwo,
    String? contactDeskThree,
    String? contactDeskFour,
    String? contactDeskFive,
    String? contactDeskSix,
    String? contactDeskSeven,
    String? contactDeskEight,
    String? hourEnd,
    String? dateLimit,
    int? viewCount,
    int? watchesCount,
    String? auctioneer,
    String? auctionhouse,
    String? city,
    String? catalogUrl,
    List<String>? banners,
    List<AuctionLot>? lots,
    List<String>? contents,
    List<String>? desks,
    List<String>? contactDesks,
  }) {
    return AuctionEvent(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      isOnline: isOnline ?? this.isOnline,
      type: type ?? this.type,
      contact: contact ?? this.contact,
      streaming: streaming ?? this.streaming,
      link: link ?? this.link,
      address: address ?? this.address,
      zipCode: zipCode ?? this.zipCode,
      image: image ?? this.image,
      video: video ?? this.video,
      buttonText: buttonText ?? this.buttonText,
      catalog: catalog ?? this.catalog,
      regulation: regulation ?? this.regulation,
      isEnabled: isEnabled ?? this.isEnabled,
      isFeatured: isFeatured ?? this.isFeatured,
      auctionHouseId: auctionHouseId ?? this.auctionHouseId,
      cityId: cityId ?? this.cityId,
      player: player ?? this.player,
      local: local ?? this.local,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      deskOne: deskOne ?? this.deskOne,
      deskTwo: deskTwo ?? this.deskTwo,
      deskThree: deskThree ?? this.deskThree,
      deskFour: deskFour ?? this.deskFour,
      deskFive: deskFive ?? this.deskFive,
      deskSix: deskSix ?? this.deskSix,
      deskSeven: deskSeven ?? this.deskSeven,
      deskEight: deskEight ?? this.deskEight,
      tenantId: tenantId ?? this.tenantId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      freePhone: freePhone ?? this.freePhone,
      website: website ?? this.website,
      landline: landline ?? this.landline,
      contactDeskOne: contactDeskOne ?? this.contactDeskOne,
      contactDeskTwo: contactDeskTwo ?? this.contactDeskTwo,
      contactDeskThree: contactDeskThree ?? this.contactDeskThree,
      contactDeskFour: contactDeskFour ?? this.contactDeskFour,
      contactDeskFive: contactDeskFive ?? this.contactDeskFive,
      contactDeskSix: contactDeskSix ?? this.contactDeskSix,
      contactDeskSeven: contactDeskSeven ?? this.contactDeskSeven,
      contactDeskEight: contactDeskEight ?? this.contactDeskEight,
      hourEnd: hourEnd ?? this.hourEnd,
      dateLimit: dateLimit ?? this.dateLimit,
      viewCount: viewCount ?? this.viewCount,
      watchesCount: watchesCount ?? this.watchesCount,
      auctioneer: auctioneer ?? this.auctioneer,
      auctionhouse: auctionhouse ?? this.auctionhouse,
      city: city ?? this.city,
      catalogUrl: catalogUrl ?? this.catalogUrl,
      banners: banners ?? this.banners,
      lots: lots ?? this.lots,
      contents: contents ?? this.contents,
      desks: desks ?? this.desks,
      contactDesks: contactDesks ?? this.contactDesks,
    );
  }
}
