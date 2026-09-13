class DtcEntry {
  DtcEntry({
    required this.code,
    required this.titleTR,
    required this.titleEN,
    required this.descriptionTR,
    required this.descriptionEN,
    required this.severity,
    required this.partId,
    required this.repairStepsTR,
    required this.repairStepsEN,
    required this.safetyNotesTR,
    required this.safetyNotesEN,
  });

  final String code;
  final String titleTR;
  final String titleEN;
  final String descriptionTR;
  final String descriptionEN;
  final String severity;
  final String partId;
  final List<String> repairStepsTR;
  final List<String> repairStepsEN;
  final String safetyNotesTR;
  final String safetyNotesEN;

  factory DtcEntry.fromJson(Map<String, dynamic> json) => DtcEntry(
        code: json['code'] as String,
        titleTR: json['titleTR'] as String,
        titleEN: json['titleEN'] as String,
        descriptionTR: json['descriptionTR'] as String,
        descriptionEN: json['descriptionEN'] as String,
        severity: json['severity'] as String,
        partId: json['partId'] as String,
        repairStepsTR: (json['repairStepsTR'] as List).cast<String>(),
        repairStepsEN: (json['repairStepsEN'] as List).cast<String>(),
        safetyNotesTR: json['safetyNotesTR'] as String,
        safetyNotesEN: json['safetyNotesEN'] as String,
      );

  String title(bool tr) => tr ? titleTR : titleEN;
  String description(bool tr) => tr ? descriptionTR : descriptionEN;
  List<String> steps(bool tr) => tr ? repairStepsTR : repairStepsEN;
  String safety(bool tr) => tr ? safetyNotesTR : safetyNotesEN;
}

class PartInfo {
  PartInfo({
    required this.id,
    required this.nameTR,
    required this.nameEN,
    required this.category,
    required this.usdzEntityName,
    required this.relatedCodes,
  });

  final String id;
  final String nameTR;
  final String nameEN;
  final String category;
  final String usdzEntityName;
  final List<String> relatedCodes;

  factory PartInfo.fromJson(Map<String, dynamic> json) => PartInfo(
        id: json['id'] as String,
        nameTR: json['nameTR'] as String,
        nameEN: json['nameEN'] as String,
        category: json['category'] as String,
        usdzEntityName: json['usdzEntityName'] as String,
        relatedCodes: (json['relatedCodes'] as List).cast<String>(),
      );

  String name(bool tr) => tr ? nameTR : nameEN;
}

class VehicleInfo {
  VehicleInfo({
    required this.vin,
    required this.make,
    required this.model,
    required this.year,
    this.bodyClass,
  });

  final String vin;
  final String make;
  final String model;
  final String year;
  final String? bodyClass;

  String get displayName => [year, make, model].where((e) => e.isNotEmpty).join(' ');
}

class RepairPost {
  RepairPost({
    required this.id,
    required this.dtcCode,
    required this.title,
    required this.summary,
    required this.authorId,
    required this.authorName,
    this.makeModel,
    required this.likesCount,
    required this.commentsCount,
    required this.createdAt,
    required this.status,
  });

  final String id;
  final String dtcCode;
  final String title;
  final String summary;
  final String authorId;
  final String authorName;
  final String? makeModel;
  int likesCount;
  int commentsCount;
  final DateTime createdAt;
  final String status;
}

class RepairComment {
  RepairComment({
    required this.id,
    required this.authorId,
    required this.authorName,
    required this.text,
    required this.createdAt,
  });

  final String id;
  final String authorId;
  final String authorName;
  final String text;
  final DateTime createdAt;
}

class VideoItem {
  VideoItem({
    required this.id,
    required this.dtcCode,
    required this.title,
    required this.authorId,
    required this.authorName,
    required this.durationSeconds,
    required this.createdAt,
    required this.status,
    this.localPath,
  });

  final String id;
  final String dtcCode;
  final String title;
  final String authorId;
  final String authorName;
  final int durationSeconds;
  final DateTime createdAt;
  final String status;
  final String? localPath;
}

class AppUser {
  AppUser({
    required this.id,
    required this.displayName,
    this.email,
    required this.role,
    this.monthlyVideoUploads = 0,
    String? videoQuotaMonthKey,
  }) : videoQuotaMonthKey = videoQuotaMonthKey ?? _monthKey();

  final String id;
  final String displayName;
  final String? email;
  final String role;
  int monthlyVideoUploads;
  String videoQuotaMonthKey;

  static String _monthKey() {
    final n = DateTime.now();
    return '${n.year}-${n.month.toString().padLeft(2, '0')}';
  }
}

class DiagnosisResult {
  DiagnosisResult({
    required this.vehicle,
    required this.entry,
    required this.part,
  });

  final VehicleInfo vehicle;
  final DtcEntry entry;
  final PartInfo part;
}
