import Foundation
import Observation
import StoreKit

@Observable
@MainActor
final class SubscriptionService {
    /// Product IDs — create matching subscriptions in App Store Connect.
    static let monthlyId = "com.cardoctor.pro.monthly"
    static let yearlyId = "com.cardoctor.pro.yearly"

    private(set) var isPremium = false
    private(set) var products: [Product] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    /// Local override for Simulator / demo without StoreKit config.
    var demoPremiumOverride = false

    var effectivePremium: Bool { isPremium || demoPremiumOverride }

    func refresh() async {
        isLoading = true
        defer { isLoading = false }
        do {
            products = try await Product.products(for: [Self.monthlyId, Self.yearlyId])
            for await result in Transaction.currentEntitlements {
                if case .verified(let transaction) = result {
                    if transaction.productID == Self.monthlyId || transaction.productID == Self.yearlyId {
                        isPremium = true
                        await transaction.finish()
                    }
                }
            }
        } catch {
            // StoreKit unavailable in early setup — keep demo path.
            errorMessage = error.localizedDescription
            products = []
        }
    }

    func purchase(_ product: Product) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                if case .verified(let transaction) = verification {
                    isPremium = true
                    await transaction.finish()
                }
            case .userCancelled, .pending:
                break
            @unknown default:
                break
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func restore() async {
        try? await AppStore.sync()
        await refresh()
    }

    func enableDemoPremium() {
        demoPremiumOverride = true
    }
}
