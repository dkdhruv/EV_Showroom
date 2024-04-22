//
//  Spare parts model.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 13/04/24.
//

import Foundation

struct Product : Identifiable {
    
    var id = UUID()
    var name : String
    var image : String
    var price : Int
}

var productList :[Product] = [Product(id: UUID(), name: "Rim", image: "Zing-Rim-1", price: 2562),
                              Product(id: UUID(), name: "Battery", image: "Spare-2", price: 23000),
                              Product(id: UUID(), name: "Motor", image: "Spare-3", price: 9500),
                              Product(id: UUID(), name: "Controller", image: "Spare-4", price: 4800),
                              Product(id: UUID(), name: "Converter", image: "Spare-5", price: 2100),
                              Product(id: UUID(), name: "Bearing", image: "Spare-6", price: 150),
                              Product(id: UUID(), name: "Brakshoe", image: "Spare-7", price: 450),
                              Product(id: UUID(), name: "Cluster meter", image: "Spare-8", price: 1250),]

