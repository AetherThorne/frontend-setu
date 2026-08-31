import 'package:hive/hive.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 0)
class PatientLocal extends HiveObject {
  @HiveField(0)
  final String abhaId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int age;

  @HiveField(3)
  bool synced;

  PatientLocal({
    required this.abhaId,
    required this.name,
    required this.age,
    this.synced = false,
  });
}