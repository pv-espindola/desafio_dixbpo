import 'people.dart';

class User {
  int id;
  String email;
  DateTime? emailVerifiedAt;
  int isEnabled;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  int personId;
  People people;
  List<Tenant> tenants;

  User({
    required this.id,
    required this.email,
    this.emailVerifiedAt,
    required this.isEnabled,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.personId,
    required this.people,
    required this.tenants,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'is_enabled': isEnabled,
      'phone': phone,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'person_id': personId,
      'people': people,
      'tenants': tenants,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    DateTime? emailVerifiedAt = map['email_verified_at'] != null
        ? DateTime.parse(map['email_verified_at'])
        : null;
    DateTime createdAt = DateTime.parse(map['created_at']);
    DateTime updatedAt = DateTime.parse(map['updated_at']);
    List<dynamic> tenantsData = map['tenants'];
    List<Tenant> tenants = List.generate(
        tenantsData.length, (index) => Tenant.fromMap(tenantsData[index]));

    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      emailVerifiedAt: emailVerifiedAt,
      isEnabled: map['is_enabled'] as int,
      phone: map['phone'] as String,
      createdAt: createdAt,
      updatedAt: updatedAt,
      personId: map['person_id'] as int,
      people:  People.fromMap(map['people']),
      tenants: tenants,
    );
  }
}
