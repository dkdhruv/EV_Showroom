//
//  Wishlist view.swift
//  AirBnb Clone
//
//  Created by Admin on 06/04/24.
//

import SwiftUI

struct Wishlist_view: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading , spacing: 30){
//                Text("Wishlists")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
                VStack(alignment:.leading , spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create,view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                Button(action: {}, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width:350,height:40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        //.padding(.top)
                        
               })
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
        
    }
}

#Preview {
    Wishlist_view()
}
