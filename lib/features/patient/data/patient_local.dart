// lib/features/patient/data/patient_local.dart
import 'package:hive/hive.dart';

part 'patient_local.g.dart';

@HiveType(typeId: 0)
class PatientLocal extends HiveObject {
  @HiveField(0)
  final String clientUuid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final String village;

  @HiveField(4)
  final String? phone;

  @HiveField(5)
  final String facilityId;

  @HiveField(6)
  bool synced;

  PatientLocal({
    required this.clientUuid,
    required this.name,
    required this.age,
    required this.village,
    this.phone,
    required this.facilityId,
    this.synced = false,
  });
}