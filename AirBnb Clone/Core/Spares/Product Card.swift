//
//  Product Card.swift
//  AirBnb Clone
//
//  Created by Admin on 13/04/24.
//

import SwiftUI

struct Product_Card: View {
    var product : Product
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        ZStack(alignment : .topTrailing) {
            
            ZStack(alignment:.bottom){
                Image(product.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment :.leading){
                    Text(product.name)
                        .bold()
                    Text("Rs.\(product.price)/-")
//                        .foregroundStyle(Color.accentColor)
                    
                }
                .padding()
                .frame(width: 180,alignment: .leading)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 180,height: 250)
        .shadow(radius: 3)
            
            Button(action: {
                cartManager.addToCart(product: product)
            },
                   
                   label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding()
                
            })
        }
    }
}

#Preview {
    Product_Card(product: productList[0])
        .environmentObject(CartManager())
}
