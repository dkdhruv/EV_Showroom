//
//  Cart Button.swift
//  AirBnb Clone
//
//  Created by Admin on 13/04/24.
//

import SwiftUI

struct Cart_Button: View {
    var numberofproducts : Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart.fill")
                .padding(.top,5)
                .imageScale(.large)
            if numberofproducts > 0 {
                Text("\(numberofproducts)")
                    .font(.caption2)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 15,height: 15)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
        }
    }
}

#Preview {
    Cart_Button(numberofproducts: 1)
}
