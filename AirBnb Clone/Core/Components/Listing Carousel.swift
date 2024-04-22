//
//  Listing Carousel.swift
//  AirBnb Clone
//
//  Created by Admin on 03/04/24.
//

import SwiftUI

struct Listing_Carousel: View {
//    var images = [
//    "Zing-Blue",
//    "Zing-White",
//    "Zing-Red",
//    ]
    let listing : ListingModel
    var body: some View {
        TabView{
            ForEach(listing.imageurls, id: \.self){ image in
//                ForEach(images, id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .frame(height: 320)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
        .tabViewStyle(.page)
    }
}

#Preview {
    Listing_Carousel(listing: Devpreview().listings[0])
}
