//
//  Booking Page.swift
//  AirBnb Clone
//
//  Created by Dhruv on my Birthday in 2024
//

import SwiftUI

struct Booking_Page: View {
    let listing : ListingModel
    @Binding var name : String
    @Binding var address : String
    @Binding var dealer : String
    @State private  var dob = Date()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment:.topLeading){
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
                    .padding(32)
                    .padding(.top)
            }
            VStack{
                Image("\(listing.vehicleimageurl)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .shadow(radius: 25)
                    .padding()
                Text("\(listing.vehiclename)")
                    .font(.title)
                    .fontWeight(.bold)
//                Divider()
                
                Form{
                    Custom_TextField(text: $name, placeholder: "Enter Full Name")
                        .foregroundStyle(.black)
                    Custom_TextField(text: $address, placeholder: "Enter Delivery Address")
                        .foregroundStyle(.black)
                    Custom_TextField(text: $dealer, placeholder: "Select Dealer Name")
                        .foregroundStyle(.black)
                    DatePicker("Delivery Date", selection: $dob, displayedComponents: .date)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                        .padding(.top,10)
                    Text("Booking Amount :     Rs. \(listing.bookingamount)/-")
                }
                
                HStack{
                    Image(systemName: "hand.tap")
                        .imageScale(.large)
                    
                    
                    Menu("Select Payment Mode") {
                        Button(
                            action : Paytm,
                            label :{
                                HStack{
                                    Text("PayTm")
                                    Image(systemName: "bitcoinsign.circle")
                                    
                                }
                            }
                        )
                        Button("NEFT/RTGS", action: NEFT)
                        Button("Net Banking", action: Banking)
                        
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Text("Pay Now")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:100,height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    
                }
                .padding()
                .padding(.horizontal,10)
                
                
            }

        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .top, endPoint: .bottom))
        
        
    }
    func Paytm() {}
    func NEFT() {}
    func Banking() {}
}

#Preview {
    Booking_Page(listing: Devpreview().listings[1], name: .constant(""), address: .constant(""), dealer: .constant(""))
        .preferredColorScheme(.dark)
}
