class People{
  int id;
  int type;
  String name;
  String? nickname;
  String? stateRegistration;
  String nif;
  String email;
  String address;
  String complement;
  String number;
  String zipCode;
  int cityId;
  String phone;
  String? logo;
  DateTime createdAt;
  DateTime updatedAt;
  City city;

  People({
    required this.id,
    required this.type,
    required this.name,
    this.nickname,
    this.stateRegistration,
    required this.nif,
    required this.email,
    required this.address,
    required this.complement,
    required this.number,
    required this.zipCode,
    required this.cityId,
    required this.phone,
    this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'nickname': nickname,
      'state_registration': stateRegistration,
      'nif': nif,
      'email': email,
      'address': address,
      'complement': complement,
      'number': number,
      'zip_code': zipCode,
      'city_id': cityId,
      'phone': phone,
      'logo': logo,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'city': city,
    };
  }

  factory People.fromMap(Map<String, dynamic> map) {
    DateTime createdAt = DateTime.parse(map['created_at']);
    DateTime updatedAt = DateTime.parse(map['updated_at']);
    return People(
      id: map['id'] as int,
      type: map['type'] as int,
      name: map['name'] ,
      nickname: map['nickname'],
      stateRegistration: map['state_registration'],
      nif: map['nif'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      complement: map['complement'] as String,
      number: map['number'] as String,
      zipCode: map['zip_code'] as String,
      cityId: map['city_id'] as int,
      phone: map['phone'] ,
      logo: map['logo'] ,
      createdAt: createdAt,
      updatedAt: updatedAt,
      city: City.fromMap(map['city']),
    );
  }
}

class City{
  int id;
  String title;
  String letter;

  City({
    required this.id,
    required this.title,
    required this.letter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'letter': letter,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int,
      title: map['title'] as String,
      letter: map['letter'] as String,
    );
  }
}

class Tenant{
  int id;
  int personId;
  String signatureDate;
  String planUntil;
  int method;
  int months;
  String dueDate;
  String monthCost;
  String additionalCost;
  int dueDay;
  int status;
  int nps;
  int sendEmail;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Tenant({
    required this.id,
    required this.personId,
    required this.signatureDate,
    required this.planUntil,
    required this.method,
    required this.months,
    required this.dueDate,
    required this.monthCost,
    required this.additionalCost,
    required this.dueDay,
    required this.status,
    required this.nps,
    required this.sendEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'person_id': personId,
      'signature_date': signatureDate,
      'plan_until': planUntil,
      'method': method,
      'months': months,
      'due_date': dueDate,
      'month_cost': monthCost,
      'additional_cost': additionalCost,
      'due_day': dueDay,
      'status': status,
      'nps': nps,
      'send_email': sendEmail,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pivot': pivot,
    };
  }

  factory Tenant.fromMap(Map<String, dynamic> map) {
    DateTime createdAt = DateTime.parse(map['created_at']);
    DateTime updatedAt = DateTime.parse(map['updated_at']);
    return Tenant(
      id: map['id'] as int,
      personId: map['person_id'] as int,
      signatureDate: map['signature_date'] as String,
      planUntil: map['plan_until'] as String,
      method: map['method'] as int,
      months: map['months'] as int,
      dueDate: map['due_date'] as String,
      monthCost: map['month_cost'] as String,
      additionalCost: map['additional_cost'] as String,
      dueDay: map['due_day'] as int,
      status: map['status'] as int,
      nps: map['nps'] as int,
      sendEmail: map['send_email'] as int,
      createdAt: createdAt,
      updatedAt: updatedAt,
      pivot: Pivot.fromMap(map['pivot']),
    );
  }
}

class Pivot{
  int userId;
  int tenantId;
  DateTime createdAt;
  DateTime updatedAt;

  Pivot({
    required this.userId,
    required this.tenantId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'tenant_id': tenantId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    DateTime createdAt = DateTime.parse(map['created_at']);
    DateTime updatedAt = DateTime.parse(map['updated_at']);
    return Pivot(
      userId: map['user_id'] as int,
      tenantId: map['tenant_id'] as int,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

