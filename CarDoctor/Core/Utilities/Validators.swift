import Foundation

enum VinValidator {
    /// ISO 3779 VIN: 17 chars, no I/O/Q.
    static func normalize(_ raw: String) -> String {
        raw.uppercased()
            .replacingOccurrences(of: " ", with: "")
            .filter { $0.isLetter || $0.isNumber }
    }

    static func isValid(_ raw: String) -> Bool {
        let vin = normalize(raw)
        guard vin.count == 17 else { return false }
        let forbidden: Set<Character> = ["I", "O", "Q"]
        return vin.allSatisfy { !$0.isWhitespace && !forbidden.contains($0) }
    }
}

enum DtcParser {
    /// Accepts P0300, p0300, P 0300 → P0300
    static func normalize(_ raw: String) -> String {
        let cleaned = raw.uppercased().filter { $0.isLetter || $0.isNumber }
        guard cleaned.count >= 5 else { return cleaned }
        return String(cleaned.prefix(5))
    }

    static func isValid(_ raw: String) -> Bool {
        let code = normalize(raw)
        guard code.count == 5 else { return false }
        let prefix = code.first!
        let validPrefixes: Set<Character> = ["P", "B", "C", "U"]
        guard validPrefixes.contains(prefix) else { return false }
        return code.dropFirst().allSatisfy(\.isNumber)
    }
}
