//
//  Message Field.swift
//  AirBnb Clone
//
//  Created by Dhruv on 21/04/24.
//

import SwiftUI

struct Message_Field: View {
    @State private var message = ""
    @EnvironmentObject  var messagesManager : MessagesManager
    var body: some View {
        HStack{
            CustomMessageField(placeholder: Text("Type your message here"), text: $message)
                .foregroundStyle(.black)
            Button(action: {
                messagesManager.sendMessage(text: message)
                message = ""
                
            }, label: {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .clipShape(Circle())
            })
            // MARK: - Message Field
        }
        .padding(.horizontal)
        .padding(.vertical,13)
        .background(.veryLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .padding()
    }
}

#Preview {
    Message_Field()
        .environmentObject(MessagesManager())
}


struct CustomMessageField : View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var body: some View {
        ZStack(alignment: .leading) {
                    // If text is empty, show the placeholder on top of the TextField
                    if text.isEmpty {
                        placeholder
                        .opacity(0.5)
                    }
                    TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                }
    }
}
