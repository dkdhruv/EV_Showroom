//
//  Search Bar.swift
//  AirBnb Clone
//
//  Created by Admin on 02/04/24.
//

import SwiftUI

struct Search_Bar: View {
    @Binding var modelname : String
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment:.leading,spacing: 2){
                Text(modelname.isEmpty ? "Search Model" : modelname)
                    .font(.footnote)
                    .bold()
                Text("Vehicles-Spares-Enquiry")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay{
            Capsule()
//                .stroke(style: StrokeStyle())
                .stroke(lineWidth: 1.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(radius: 2)
        }
        .padding()

    }
}

#Preview {
    Search_Bar(modelname: .constant("Zulu"))
}
