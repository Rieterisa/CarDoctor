import Foundation

/// Marker protocol for swapping local demo services with Firebase-backed ones
/// without rewriting feature screens.
protocol CarDoctorBackend: AnyObject {}

/// When Firebase packages are added, implement:
/// - FirebaseAuthService: AuthService
/// - FirestoreDtcService / RepairRepository
/// - StorageVideoUploader
///
/// Keep feature ViewModels talking only to AppModel services.
enum BackendMode {
    case localDemo
    case firebase
}
