//
//  Spare Carousel.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 13/04/24.
//

import SwiftUI

struct Spare_Carousel: View {
    var spare_image = ["Zing-Rim-1","Zing-Rim-1","Zing-Rim-1"]
    var body: some View {
        TabView{
//            ForEach(listing.imageurls, id: \.self){ image in
                ForEach(spare_image, id: \.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }

        .tabViewStyle(.page)
    }
}

#Preview {
    Spare_Carousel()
}
