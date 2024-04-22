//
//  Listing View.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 02/04/24.
//

import SwiftUI

struct Listing_View: View {
    let listing : ListingModel
//    var images = [
//        "Zing-Blue",
//        "Zing-White",
//        "Zing-Red",
//        ]
    var body: some View {
        VStack(spacing:8){
            //images
            Listing_Carousel(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment :.top){
                VStack(alignment:.leading){
                    //details
                    Text("\(listing.vehiclename)")
                        .bold()
                        .foregroundStyle(Color.accentColor)
                    Text("Red,Magic Blue, White")
                        .foregroundStyle(.gray)
                    Text("Non RTO")
                        .foregroundStyle(.gray)
                    Text("\(listing.onroadprice)")
                        .bold()
                        .foregroundStyle(Color.accentColor)
                }
                //rating
                Spacer()
                HStack(spacing :2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("\(listing.rating)")
                        .foregroundStyle(Color.accentColor)
                }
            }
            .font(.footnote)
        }
    }
}

#Preview {
    Listing_View(listing: Devpreview().listings[0])
}
