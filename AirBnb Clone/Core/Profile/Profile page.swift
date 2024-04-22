//
//  Profile page.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 05/04/24.
//

import SwiftUI

struct Profile_page: View {
    var body: some View {
        VStack {
            VStack(alignment:.leading,spacing:32){
                VStack(alignment:.leading,spacing:8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to experience the Best EV app")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.top,50)

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
                
                HStack{
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            VStack(spacing:24){
                Profile_options(imagename: "gear", title: "Settings")
                Profile_options(imagename: "accessibility", title: "Accessibility")
                Profile_options(imagename: "questionmark.circle", title: "Visit Help Centre")
                
            }
            .padding(.top)
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
            .padding(.top,100)
        }
    }
}

#Preview {
    Profile_page()
}
