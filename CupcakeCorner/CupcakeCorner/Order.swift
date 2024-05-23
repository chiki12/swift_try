//
//  Order.swift
//  CupcakeCorner
//
//  Created by rachiki on 2024/05/07.
//

import Foundation

@Observable
class Order: Codable {
//    enum CodingKeys: String, CodingKey {
//        case _type = "type"
//        case _quantity = "quantity"
//        case _specialRequestEnabled = "specialRequestEnabled"
//        case _extraFrosting = "extraFrosting"
//        case _addSprinkles = "addSprinkles"
//        case _name = "name"
//        case _city = "city"
//        case streetAddress = "streetAddress"
//        case _zip = "zip"
//    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var speacialRequestEnables = false {
        didSet {
            if speacialRequestEnables == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = "" 
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty {
//        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.5 per cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity)/2
        }
        
        return cost
    }
}