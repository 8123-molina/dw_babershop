class BarbershopModel {
  final int id;
  final String name;
  final String email;
  final List<String> openigDays;
  final List<String> openigHours;

  BarbershopModel({
    required this.id,
    required this.name,
    required this.email,
    required this.openigDays,
    required this.openigHours,
  });

  factory BarbershopModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'email': String email,
        'opening_days': final List openingDays,
        'opening_hours': final List openingHours,
      } =>
        BarbershopModel(
          id: id,
          email: email,
          name: name,
          openigDays: openingDays.cast<String>(),
          openigHours: openingHours.cast<String>(),
        ),
      _ => throw ArgumentError('Inválidi Json')
    };
  }
}
