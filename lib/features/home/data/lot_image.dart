class LotImage {
  final int id;
  final int lotId;
  final String filename;
  final int type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fileUrl;

  LotImage({
    required this.id,
    required this.lotId,
    required this.filename,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
  });

  factory LotImage.fromMap(Map<String, dynamic> map) {
    return LotImage(
      id: map['id'],
      lotId: map['lot_id'],
      filename: map['filename'],
      type: map['type'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      fileUrl: map['file_url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lot_id': lotId,
      'filename': filename,
      'type': type,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'file_url': fileUrl,
    };
  }

  LotImage copyWith({
    int? id,
    int? lotId,
    String? filename,
    int? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? fileUrl,
  }) {
    return LotImage(
      id: id ?? this.id,
      lotId: lotId ?? this.lotId,
      filename: filename ?? this.filename,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fileUrl: fileUrl ?? this.fileUrl,
    );
  }
}

class LotImageKeys {
  static const String id = 'id';
  static const String lotId = 'lot_id';
  static const String filename = 'filename';
  static const String type = 'type';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
  static const String fileUrl = 'file_url';
}