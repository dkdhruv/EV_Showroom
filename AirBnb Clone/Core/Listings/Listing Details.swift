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
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            //back custom button
            ZStack(alignment:.topLeading){
                Listing_Carousel()
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
                    Text("Kinetic Green : Zing")
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
                        Text("4.86")
                        Image(systemName: "smallcircle.filled.circle")
                            .imageScale(.small)

                        Button(action: {}, label: {
                            Text("288 reviews")
                                .underline()
                                .fontWeight(.semibold)
                        })
                    }.font(.caption)
                    HStack{
                        Text("Red")
                            .foregroundStyle(.red)
                        Text("Magic Blue")
                            .foregroundStyle(.blue)
                        Text("Royal White")
                            .foregroundStyle(.gray)
                    }
                }
                //.padding(.leading)
            }
            .padding(.leading)
            Divider()
            //short description
            HStack(spacing :25){
                VStack(alignment :.leading){
                    Text("Entire model is based on a Non registered structure By House of Kinetic")
                        .font(.headline)
                        .frame(width:250,alignment: .leading)
                    HStack(spacing:2){
                        Text("45 kmph .")
                        Text("60km .")
                        Text("60V 23 Ah .")
                    }.font(.caption)
                }
                Image("Zing-Red")
                    .resizable()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
            }
            Divider()
            //features
            VStack{
                ForEach(0..<2){ feature in
                    HStack(spacing:12)
                    {
                      Image(systemName: "battery.100percent.bolt")
                        VStack(alignment:.leading){
                            Text("Lithium ion Battery")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Lithium ion Batteries provide a more stable output and lasts for a longer period.")
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
                ForEach(0..<5){ feature in
                    HStack{
                        Image(systemName: "applepencil.adapter.usb.c.fill")
                        Text("USB Charging Slot")
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
                Map()
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
                        Text("Rs. 500/-")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.accentColor)
                        Text("Total before taxes")
                            .font(.footnote)
                            .foregroundStyle(Color.accentColor)
                        Text("Apr 1 - 30")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.accentColor)
                            .underline()
                        
                    }
                    Spacer()
                    Button{}
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

#Preview {
    Listing_Details()
}
