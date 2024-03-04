class LastShot {
  final int id;
  final int lotId;
  final int clientId;
  final int value;
  final int oldValue;
  final String date;
  final String time;
  final String comesFrom;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double unitValue;

  LastShot({
    required this.id,
    required this.lotId,
    required this.clientId,
    required this.value,
    required this.oldValue,
    required this.date,
    required this.time,
    required this.comesFrom,
    required this.createdAt,
    required this.updatedAt,
    required this.unitValue,
  });

  factory LastShot.fromMap(Map<String, dynamic> map) {
    var num = map['unitValue'];
    double unitValue = num.runtimeType == double? num : (map['unitValue']).toDouble();
    return LastShot(
      id: map['id'],
      lotId: map['lot_id'],
      clientId: map['client_id'],
      value: map['value'],
      oldValue: map['old_value'],
      date: map['date'],
      time: map['time'],
      comesFrom: map['comes_from'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      unitValue: unitValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lot_id': lotId,
      'client_id': clientId,
      'value': value,
      'old_value': oldValue,
      'date': date,
      'time': time,
      'comes_from': comesFrom,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'unitValue': unitValue,
    };
  }

  LastShot copyWith({
    int? id,
    int? lotId,
    int? clientId,
    int? value,
    int? oldValue,
    String? date,
    String? time,
    String? comesFrom,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? unitValue,
  }) {
    return LastShot(
      id: id ?? this.id,
      lotId: lotId ?? this.lotId,
      clientId: clientId ?? this.clientId,
      value: value ?? this.value,
      oldValue: oldValue ?? this.oldValue,
      date: date ?? this.date,
      time: time ?? this.time,
      comesFrom: comesFrom ?? this.comesFrom,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      unitValue: unitValue ?? this.unitValue,
    );
  }
}

class LastShotKeys {
  static const String id = 'id';
  static const String lotId = 'lot_id';
  static const String clientId = 'client_id';
  static const String value = 'value';
  static const String oldValue = 'old_value';
  static const String date = 'date';
  static const String time = 'time';
  static const String comesFrom = 'comes_from';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String unitValue = 'unitValue';
}
