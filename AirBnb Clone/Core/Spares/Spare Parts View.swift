//
//  Spare Parts View.swift
//  AirBnb Clone
//
//  Created by Dhruv on 12/04/24.
//

import SwiftUI

struct Spare_Parts_View: View {
    @StateObject var  cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160, maximum: 170),spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns : columns ,spacing: 10) {
                    ForEach(productList ,id: \.id){product in
                        Product_Card(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Spare Parts"))
            .toolbar{
                NavigationLink{
                    Cart_View()
                        .environmentObject(cartManager)
                } label: {
                    Cart_Button(numberofproducts: cartManager.products.count)
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#Preview {
    Spare_Parts_View()
}
