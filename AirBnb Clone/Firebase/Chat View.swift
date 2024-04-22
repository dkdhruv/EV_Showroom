//
//  Chat View.swift
//  AirBnb Clone
//
//  Created by DK on 21/04/24.
//

import SwiftUI

struct Chat_View: View {
    @State private var messagesManager = MessagesManager()
    var body: some View {
        VStack {
            VStack{
                Title_Row()
                
               ScrollViewReader{ proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id:\.id){ message in
                            Message_Bubble(message: message)
                        }
                    }
                    .padding(.top,10)
                    .background(.veryLightGray)
                    .cornerRadius(30, corners: [.topLeft,.topRight])
                    .onChange(of: messagesManager.lastMessageId){ id in
                        withAnimation{
                            proxy.scrollTo(id,anchor: .bottom)
                        }
                    }
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading))
            
            Message_Field()
                .environmentObject(messagesManager)
        }
        
    }
}

#Preview {
    Chat_View()
}
