//
//  Product.swift
//  UI-386
//
//  Created by nyannyan0328 on 2021/12/07.
//

import SwiftUI

struct Product: Identifiable {
    
    var id = UUID().uuidString
    var type : ProductType
    var title : String
    var subtitle : String
    var price : String
    var productImage = ""
    var quntity : Int = 0
    
   
}

enum ProductType : String,CaseIterable{
    
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
    
}



