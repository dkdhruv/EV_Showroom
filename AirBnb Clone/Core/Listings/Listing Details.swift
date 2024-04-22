//
//  Listing Details.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 03/04/24.
//

import SwiftUI
import MapKit


struct Listing_Details: View {
    var images = [
        "Zing-Blue",
        "Zing-White",
        "Zing-Red",]
    let listing : ListingModel
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition : MapCameraPosition
    
    
    init(listing : ListingModel){
        self.listing = listing
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 23.25164799811932, longitude: 77.4311252246152), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        // center : listing.city == "LA"? .LA:.miami // put this above to get dynamic location on map
        self._cameraPosition = State(initialValue: .region(region))
        }
    @State private var showPayment = false
    var body: some View {
        if showPayment {

                Booking_Page(listing: listing, name: .constant(""), address: .constant(""), dealer: .constant(""))
            
        }
        else{
            ScrollView{
                //back custom button
                ZStack(alignment:.topLeading){
                    Listing_Carousel(listing: listing)
                        .frame(height: 320)
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background{
                                Circle()
                                    .fill(.white)
                                    .frame(width: 32,height: 32)
                            }
                            .padding(42)
                            .padding(.top)
                    }
                    
                }
                //heading
                VStack(alignment : .leading){
                    HStack{
                        Text("Kinetic Green : \(listing.vehiclename)")
                            .padding(.top,4)
                            .padding(.horizontal,3)
                            .font(.title)
                            .fontWeight(Font.Weight.heavy)
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        HStack(spacing :2){
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("\(listing.rating)")
                            Image(systemName: "smallcircle.filled.circle")
                                .imageScale(.small)
                            
                            Button(action: {}, label: {
                                Text("288 reviews") //need to add reviews in Data Model
                                    .underline()
                                    .fontWeight(.semibold)
                            })
                        }.font(.caption)
                        HStack{
                            Text("Red")// need to add colors in Data Model
                                .foregroundStyle(.red)
                            Text("Magic Blue")
                                .foregroundStyle(.blue)
                            Text("Royal White")
                                .foregroundStyle(.veryLightGray)
                        }
                    }
                    //.padding(.leading)
                }
                .padding(.leading)
                Divider()
                //short description
                HStack(spacing :25){
                    VStack(alignment :.leading){
                        Text("Entire model \(listing.vehiclename) is based on a Non registered structure By House of Kinetic")//need to add structure description in Data Model
                            .font(.headline)
                            .frame(width:250,alignment: .leading)
                        HStack(spacing:2){
                            Text("\(listing.topspeed)kmph .")
                            Text("\(listing.range)km .")
                            Text("\(listing.voltage)V \(listing.Ah)Ah .")
                        }.font(.caption)
                    }
                    Image("\(listing.vehicleimageurl)")
                        .resizable()
                        .frame(width: 80,height: 80)
                        .clipShape(Circle())
                }
                Divider()
                //features
                VStack{
                    ForEach(listing.features){ feature in
                        HStack(spacing:12)
                        {
                            Image(systemName: feature.imagename)
                            VStack(alignment:.leading){
                                Text(feature.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                Text(feature.subtitle)
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                        }}
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding()
                Divider()
                //experience section
                VStack(alignment:.leading,spacing: 16){
                    Text("Experience you'll get")
                        .font(.headline)
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing:8){
                            ForEach(1..<5){ experience in //need data model here
                                VStack{
                                    Image(systemName:"lock.app.dashed")
                                        .imageScale(.large)
                                    Text("Anti Theft Locking \(experience)")
                                        .frame(width:100)
                                        .font(.headline)
                                }
                                .frame(width:140,height:100)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(style: StrokeStyle())
                                }
                            }
                        }
                        
                    }.scrollTargetBehavior(.paging)
                }.padding()
                Divider()
                //list of features
                VStack(alignment:.leading,spacing: 16){
                    Text("Unique Features")
                        .font(.headline)
                        .fontWeight(.semibold)
                    ForEach(listing.uniquefeatures){ feature in
                        HStack{
                            Image(systemName: feature.imagename)
                            Text(feature.title)
                                .font(.caption)
                            Spacer()
                        }
                    }
                    
                }.padding()
                Divider()
                //location
                VStack(alignment:.leading,spacing :16){
                    Text("Locate Us")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Map(position: $cameraPosition)
                        .frame(height:300)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }.padding()
                
            }
            .toolbar(.hidden, for: .tabBar)
            .ignoresSafeArea()
            .padding(.bottom,64)
            .overlay(alignment:.bottom){
                VStack{
                    Divider()
                        .padding(.bottom)
                    HStack{
                        VStack(alignment:.leading){
                            Text("Rs.\(listing.bookingamount)/-")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.accentColor)
                            Text("Total before taxes")
                                .font(.footnote)
                                .foregroundStyle(Color.accentColor)
                            Text("Ex Showroom Price Rs. \(listing.onroadprice)/-")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.accentColor)
                                .underline()
                            
                        }
                        Spacer()
                        Button{
                            action : do {
                                withAnimation(.bouncy){
                                    showPayment.toggle()
                                }
                            }
                        }
                    label: {
                        Text("Book Now")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:140,height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    }
                    .padding(.horizontal,32)
                }
                .background(.white)
            }
        }
    }
}

#Preview {
    Listing_Details(listing: Devpreview().listings[2])
}
