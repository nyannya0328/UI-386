//
//  HomeViewModel.swift
//  UI-386
//
//  Created by nyannyan0328 on 2021/12/07.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentType : ProductType = .Wearable
    
    @Published var products : [Product] = [
    
    
    
    
        
            Product(type: .Wearable, title: "apple watch", subtitle: "Series 6: Red", price: "$359",productImage: "AppleWatch6"),
            Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
            Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4"),
            Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
            Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
            Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
            Product(type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
            Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$999", productImage: "MacBookAir"),
            Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"),
            Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
            Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir"),
            Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
            Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
            Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
        ]
    
    @Published var fileterProduct : [Product] = []
    
    
    init() {
      filterProductByType()
    }
    
    
    func filterProductByType(show : Bool = false){
        
        
        DispatchQueue.global(qos: .userInteractive).async{
            
            
            let result = self.products.lazy.filter { product in
                
                
                return product.type == self.currentType
            }
            
            
            DispatchQueue.main.async {
                
                self.fileterProduct = result.map({ product in
                    
                    return product
                    
                })
            }
            
            
            
        }
        
        
        
    }
    
}
