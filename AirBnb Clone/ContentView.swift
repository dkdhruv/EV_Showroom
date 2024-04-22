//
//  ContentView.swift
//  AirBnb Clone
//
//  Created by Admin on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            List(1 ..< 15) { item in
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    Text("Hello, world!")
                    
                        .frame(width: 200,height: 200)
                        .border(Color.black,width: 3)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red,Color.yellow,Color.green]), startPoint: .topTrailing, endPoint: .bottomLeading))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
                        .opacity(1)
                        .badge(item)
                    
                }
                .padding()
            }
            
        }
    
}

#Preview {
    ContentView()
}
