//
//  Store.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import StoreKit

@MainActor
@Observable
class Store {
    var products: [Product] = []
    var purchased = Set<String>()
    
    private var updates: Task<Void, Never>? = nil
    
    // Load all products
    func loadProdcuts() async {
        do {
            products = try await Product.products(for: ["hp4", "hp5", "hp6", "hp7"])
            products.sort {
                $0.displayName < $1.displayName
            }
        } catch {
            print("Unable to load products: \(error)")
        }
    }
    
    // Purchase product
    func purchase(_ product: Product) async {
        do {
            let result = try await product.purchase()
            
            switch result {
                // Purchase Successful, Verify transaction
            case .success(let verificationResult):
                switch verificationResult {
                case .unverified(let signedType, let verficationError):
                    print("Error on \(signedType): \(verficationError)")
                    
                case .verified(let signedType):
                    purchased.insert(signedType.productID)
                    await signedType.finish()
                }
                
                // User cancelled or disapproved request
            case .userCancelled:
                break
                
                // Waiting for some sort of approval
            case .pending:
                break
                
                // All unknown cases
            @unknown default:
                break
            }
            
        } catch {
            print("Unable to purchase product: \(error)")
        }
    }
    
    // Check for purchased products
    
    // Connect with App Store (pruchase & transaction)
}
