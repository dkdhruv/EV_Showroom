//
//  Cart Manager.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 13/04/24.
//

import Foundation

class CartManager : ObservableObject {
    
    @Published  var products: [Product] = [] // have removed private due to issue with using it in cart button label
    @Published  var total : Int = 0
    
    func addToCart(product : Product){
        products.append(product)
        total += product.price
    }
    func removeFromCart(product : Product){
        products = products.filter{$0.id != product.id}
        total -= product.price
    }
}
