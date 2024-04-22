//
//  Explore View.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 01/04/24.
//

import SwiftUI

struct Explore_View: View {
    @State private var showfilter = false
    @StateObject var VM = ExploreVM(service: ExploreService())
    
//    let listing : ListingModel
    var body: some View {
        NavigationStack{
            if showfilter {
                Search_filter(showexplore: $showfilter, VM: VM)
                    
            }
            else{
                Search_Bar(modelname: $VM.searchVehicle)
                    .onTapGesture {
                        withAnimation(.snappy){
                            showfilter.toggle()
                        }
                    }
                ScrollView{
                    LazyVStack(spacing:32){
//                        ForEach(0...10,id: \.self){ listing in
                        ForEach(VM.listings){ listing in
                            NavigationLink(value: listing, label: {
                                Listing_View(listing: listing)
                                    .foregroundColor(.black)
                                    .frame(height:400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            })
                        }
                    }
                    .padding()
                }.navigationDestination(for: ListingModel.self){ listing in
                    Listing_Details(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
            
    }
}

#Preview {
    Explore_View()
}
