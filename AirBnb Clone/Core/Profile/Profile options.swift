//
//  Profile options.swift
//  AirBnb Clone
//
//  Created by Admin on 06/04/24.
//

import SwiftUI

struct Profile_options: View {
    let imagename : String
    let title : String
    var body: some View {
        VStack {
            HStack{
                Image(systemName:imagename)
                
                Text(title)
                    .font(.subheadline)
                Spacer()
                Image(systemName:"chevron.right")
                
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

#Preview {
    Profile_options(imagename: "gear", title: "Settings")
}
