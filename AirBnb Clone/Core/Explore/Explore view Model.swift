//
//  Explore view Model.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 08/04/24.
//

// Need to learn this properly.
// Learn this from Swift Networking Masterclass by Appstuff

import Foundation

class ExploreVM : ObservableObject {
    @Published var listings = [ListingModel]()
    @Published var searchVehicle = ""
    private let service : ExploreService
    private var listingsCopy = [ListingModel]()
    init(service : ExploreService){
        self.service = service
        Task{await fetchlisting()}
    }
    func fetchlisting() async {
        do{
            self.listings = try await service.fetchlisting()
            self.listingsCopy = listings
        }
        catch{
            print("Error is :-\(error.localizedDescription)")
        }
    }
    func filterresults(){ //_ vehicle : String
        let filteredListings = listings.filter({
            $0.vehiclename.lowercased() == searchVehicle.lowercased() ||
            $0.title.lowercased() == searchVehicle.lowercased()
        })
        self.listings = filteredListings.isEmpty ?listingsCopy : filteredListings
    }
}
