//
//  Service.swift
//  AirBnb Clone
//
//  Created by Admin on 08/04/24.
//

import Foundation

class ExploreService {
    func fetchlisting() async throws -> [ListingModel] {
        return Devpreview().listings
    }
}
