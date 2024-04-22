//
//  Cart Products.swift
//  AirBnb Clone
//
//  Created by Admin on 13/04/24.
//

import SwiftUI

struct Cart_Products: View {
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    var body: some View {
        HStack(spacing :20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment : .leading ,spacing: 5){
                Text(product.name)
                    .foregroundStyle(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                Text("Rs.\(product.price)/-")
                    .padding()
            }
            Spacer()
            
            Button(action: {
                cartManager.removeFromCart(product: product)
            }, label: {
                Image(systemName: "trash")
                    .imageScale(.large)
                    .foregroundStyle(.red)
            })
        }
        .padding(.horizontal)
        .frame(maxWidth : .infinity, alignment: .leading)
        
        Divider()
    }
}

#Preview {
    Cart_Products( product: productList[2])
        .environmentObject(CartManager())
}
