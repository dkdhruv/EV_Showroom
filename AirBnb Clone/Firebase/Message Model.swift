//
//  Message Model.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 21/04/24.
//

import Foundation

struct Message : Identifiable, Codable {
    var id : String
    var text : String
    var recieved : Bool
    var timestamp : Date
}
