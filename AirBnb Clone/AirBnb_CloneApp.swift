//
//  AirBnb_CloneApp.swift
//  AirBnb Clone
//
//  Created by Dhruv Khanna on 14/03/24.
//

import SwiftUI
import Firebase

@main
struct AirBnb_CloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //ContentView()
            Main_tab_View()
        }
    }
}
