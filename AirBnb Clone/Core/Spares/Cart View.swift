//
//  Cart View.swift
//  AirBnb Clone
//
//  Created by Admin on 13/04/24.
//

import SwiftUI

struct Cart_View: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0 {
                ForEach(cartManager.products , id: \.id) { product in
                   Cart_Products(product: product)
                }
                
                HStack{
                    Text("Your Total is :")
                        .bold()
                    Spacer()
                    Text("Rs.\(cartManager.total)/-")
                        .font(.title)
                        .bold()
                }
                .padding(.top,10)
                .frame(width: 380,height: 100)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle())
                }
                Payment_Button(action: {})
                    .padding()
            }
            else{
                VStack {
                    Text("Your Cart is Empty.")
                        .foregroundStyle(Color.accentColor)
                    Text(" Please add Spare Parts to view in Cart")
                        
                }
                    
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    Cart_View()
        .environmentObject(CartManager())
}
