//
//  Dev Preview.swift
//  AirBnb Clone
//
//  Created by Admin on 08/04/24.
//

import Foundation

class Devpreview {
    var listings :[ListingModel] = [
        
        
        .init(id: NSUUID().uuidString, vehicleid: NSUUID().uuidString, vehiclename: "Zing", vehicleimageurl: "Zing-Red", topspeed: 45, range: 60, voltage: 60, Ah: 23, bookingamount: 500, lat: 10, long: 10, imageurls: ["Zing-Red","Zing-White","Zing-Blue"], address: "C-4,padmnabh nagar", city: "Bhopal", state: "MP", title: "Zing", rating: "4.83", onroadprice: "87990", features: [.batterytype,.regen], uniquefeatures: [.USB,.chargingtime,.meter,.suspension,.tyresize]),
        
        .init(id: NSUUID().uuidString, vehicleid: NSUUID().uuidString, vehiclename: "Zulu", vehicleimageurl: "Zulu-Orange", topspeed: 70, range: 110, voltage: 60, Ah: 39, bookingamount: 600, lat: 10, long: 10, imageurls: ["Zulu-Orange","Zing-White","Zing-Red"], address: "C-4,padmnabh nagar", city:"Bhopal" , state: "MP", title: "Zulu", rating: "4.76", onroadprice: "105990", features: [.batterytype,.regen], uniquefeatures: [.USB,.chargingtime,.meter,.suspension,.tyresize]),
        
        .init(id: NSUUID().uuidString, vehicleid: NSUUID().uuidString, vehiclename: "E-Luna", vehicleimageurl: "E-Luna", topspeed: 50, range: 110, voltage: 60, Ah: 39, bookingamount: 700, lat: 10, long: 10, imageurls: ["E-Luna","Zing-Blue","Zing-Red"], address: "C-4,padmnabh nagar", city:"Bhopal" , state: "MP", title: "E-Luna", rating: "5", onroadprice: "83490", features: [.batterytype,.regen], uniquefeatures: [.USB,.chargingtime,.meter,.suspension,.tyresize])
            
        
    
    
    
           ]
}
