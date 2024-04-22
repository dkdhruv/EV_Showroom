//
//  Message Bubble.swift
//  AirBnb Clone
//
//  Created by Admin on 21/04/24.
//

import SwiftUI

struct Message_Bubble: View {
    var message : Message
    @State var showTime = false
    var body: some View {
        VStack(alignment : message.recieved ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.recieved ? .green : .lightblu )
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .frame(maxWidth: 330, alignment: message.recieved ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {

                    Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                        .padding(message.recieved ? .leading : .trailing,20)
                        .font(.caption)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: message.recieved ? .leading : .trailing)
        .padding( message.recieved ? .leading : .trailing)
        

    }
        
}

#Preview {
    Message_Bubble(message: Message(id: "12345", text: "Bla bla Bla Bla Bla bla bla bala bala bala bala abala abala abala abal abla  ", recieved: false, timestamp: Date()))
}
