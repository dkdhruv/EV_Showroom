//
//  Title Row.swift
//  AirBnb Clone
//
//  Created by Admin on 19/04/24.
//

import SwiftUI

struct Title_Row: View {
    var imageURL = URL(string:"https://images.unsplash.com/photo-1710971228630-f59c4cb257a8?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Dhruv Khanna"
    var body: some View {
        HStack(spacing:20){
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .frame(width:60,height: 60)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            } placeholder: {
                ProgressView()
            }
            VStack(alignment:.leading){
                Text(name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundStyle(.green)
                .padding(10)
                .background(.white)
                .clipShape(Circle())
                
        }
        .padding()
    }
}

#Preview {
    Title_Row()
        
}



