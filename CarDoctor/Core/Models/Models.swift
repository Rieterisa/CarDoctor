import Foundation

struct DtcEntry: Identifiable, Codable, Hashable, Sendable {
    /// Unique per code + vehicle make (brand-specific catalog; never generic-only).
    var id: String { "\(code)#\(make)" }
    let code: String
    /// Canonical make this diagnosis applies to (e.g. Honda, Toyota).
    let make: String
    let titleTR: String
    let titleEN: String
    let descriptionTR: String
    let descriptionEN: String
    let severity: FaultSeverity
    let partId: String
    let repairStepsTR: [String]
    let repairStepsEN: [String]
    let safetyNotesTR: String
    let safetyNotesEN: String

    func title(locale: Locale = .current) -> String {
        locale.language.languageCode?.identifier == "tr" ? titleTR : titleEN
    }

    func description(locale: Locale = .current) -> String {
        locale.language.languageCode?.identifier == "tr" ? descriptionTR : descriptionEN
    }

    func repairSteps(locale: Locale = .current) -> [String] {
        locale.language.languageCode?.identifier == "tr" ? repairStepsTR : repairStepsEN
    }

    func safetyNotes(locale: Locale = .current) -> String {
        locale.language.languageCode?.identifier == "tr" ? safetyNotesTR : safetyNotesEN
    }
}

enum FaultSeverity: String, Codable, Hashable, Sendable {
    case low
    case medium
    case high
    case critical

    var labelKey: String {
        switch self {
        case .low: "severity.low"
        case .medium: "severity.medium"
        case .high: "severity.high"
        case .critical: "severity.critical"
        }
    }
}

struct PartInfo: Identifiable, Codable, Hashable, Sendable {
    let id: String
    let nameTR: String
    let nameEN: String
    let category: String
    let usdzEntityName: String
    let relatedCodes: [String]

    func name(locale: Locale = .current) -> String {
        locale.language.languageCode?.identifier == "tr" ? nameTR : nameEN
    }
}

struct VehicleInfo: Identifiable, Hashable, Sendable {
    var id: String { vin }
    let vin: String
    /// Canonical brand key used for DTC lookup (never "Generic").
    let make: String
    let model: String
    let year: String
    let bodyClass: String?
    let manufacturer: String?
    let plantCountry: String?
    let vehicleType: String?
    let fuelType: String?
    let displacementL: String?
    /// VIN WMI (first 3 characters).
    var wmi: String { String(vin.prefix(3)) }

    var displayName: String {
        [year, make, model].filter { !$0.isEmpty }.joined(separator: " ")
    }
}

struct RepairPost: Identifiable, Codable, Hashable, Sendable {
    let id: String
    let dtcCode: String
    let title: String
    let summary: String
    let authorId: String
    let authorName: String
    let makeModel: String?
    let videoIds: [String]
    var likesCount: Int
    var commentsCount: Int
    let createdAt: Date
    let status: ContentStatus
}

struct RepairComment: Identifiable, Codable, Hashable, Sendable {
    let id: String
    let authorId: String
    let authorName: String
    let text: String
    let createdAt: Date
}

struct VideoItem: Identifiable, Codable, Hashable, Sendable {
    let id: String
    let repairId: String?
    let dtcCode: String
    let title: String
    let authorId: String
    let authorName: String
    let storagePath: String?
    let localFileName: String?
    let thumbnailPath: String?
    let durationSeconds: Int
    let createdAt: Date
    let status: ContentStatus
}

enum ContentStatus: String, Codable, Hashable, Sendable {
    case published
    case pending
    case rejected
}

struct AppUser: Identifiable, Codable, Hashable, Sendable {
    let id: String
    var displayName: String
    var email: String?
    var role: UserRole
    var monthlyVideoUploads: Int
    var videoQuotaMonthKey: String
}

enum UserRole: String, Codable, Hashable, Sendable {
    case user
    case admin
}
