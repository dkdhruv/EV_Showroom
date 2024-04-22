//
//  ListingModel.swift
//  AirBnb Clone
//
//  Created by Admin on 08/04/24.
//

import Foundation

struct ListingModel : Identifiable,Codable, Hashable{
    let id : String
    let vehicleid : String
    let vehiclename : String
    let vehicleimageurl : String
    let topspeed : Int
    let range : Int
    let voltage: Int
    let Ah : Int
    var bookingamount : Int
    let lat : Double
    let long : Double
    var imageurls : [String]
    let address : String
    let city : String
    let state : String
    let title : String
    var rating : String
    var onroadprice : String
    var features : [ListingFeatures]
    var uniquefeatures :[Uniquefeatures]
}


enum ListingFeatures : Int, Codable,Identifiable, Hashable {
    
    case batterytype
    case regen
    var imagename : String {
        switch self {
            
        case .batterytype:
            return "battery.100percent.bolt"
        case .regen:
            return "ev.charger.exclamationmark"
        }
    }
    var title : String{
        switch self{
            
        case .batterytype:
            return "Lithium Ion Battery"
        case .regen:
            return "Regenerative Braking System"
        }
    }
    
    var subtitle : String{
        switch self {
            
        case .batterytype:
            return "Lithium ion Batteries provide a more stable output and lasts for a longer period."
        case .regen:
            return "Vehicle charges whenever the user uses brakes while riding."
        }
    }
    var id: Int{ return self.rawValue}
}

enum Uniquefeatures : Int, Codable, Hashable, Identifiable {
    
    case USB
    case tyresize
    case meter
    case suspension
    case chargingtime
    var title : String {
        switch self {
        case.USB : return "USB Charging Slot"
        case .tyresize:
            return "10 inch wheelbase"
        case .meter:
            return "Digital Cluster meter"
        case .suspension:
            return "Telescopic Suspension"
        case .chargingtime:
            return "Charging time : 2 hours"
        }
    }
    var imagename :String{
        switch self {
            
        case .USB:
            return "applepencil.adapter.usb.c"
        case .tyresize:
            return "steeringwheel.circle"
        case .meter:
            return "gauge.with.dots.needle.50percent"
        case .suspension:
            return "key.radiowaves.forward.fill"
        case .chargingtime:
            return "bolt.car.fill"
        }
    }
    var id: Int{ return self.rawValue}
}
