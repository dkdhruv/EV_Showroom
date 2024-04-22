//
//  Messages Manager.swift
//  AirBnb Clone
//
//  Created by Dhruv on 21/04/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager : ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId: String = ""
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{ querySnapshot , error in
            guard let documents = querySnapshot?.documents
            else{
                print("Error in db which is:-\(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap{ document -> Message? in
                do{
                    // Converting each document into the Message model
                    return try document.data(as: Message.self)
                }
                catch{
                    // If we run into an error, print the error in the console
                    print("Error decoding document into Message: \(error)")

                    // Return nil if we run into an error - but the compactMap will not include it in the final array
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            // to get last message id for the scroll view reader
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text : String){
        do {

            let newMessage = Message(id: "\(UUID())", text: text, recieved: false, timestamp: Date())
            
            // Create a new document in Firestore with the newMessage variable above, and use setData(from:) to convert the Message into Firestore data

            try db.collection("messages").document().setData(from: newMessage)
            }
        catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
}
