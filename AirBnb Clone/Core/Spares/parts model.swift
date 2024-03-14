//
//  Spare parts model.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 13/04/24.
//

import Foundation

struct Product : Identifiable {
    
    var id : UUID()
    var name : String
    var image : String
    var price : Int
}
