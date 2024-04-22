//
//  Main tab View.swift
//  AirBnb Clone
//
//  Created by Admin on 06/04/24.
//

import SwiftUI

struct Main_tab_View: View {
    var body: some View {
        TabView{
            Explore_View()
                .tabItem {
                    Label("Explore",systemImage : "magnifyingglass")
                }
            Spare_Parts_View()
                .tabItem {
                    Label("Spares",systemImage : "powercord.fill")
                }
            Chat_View()
                .tabItem {
                    Label("Chats",systemImage : "bubble.left.and.bubble.right.fill")
                }
            Profile_page()
                .tabItem {
                    Label("Profile",systemImage : "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    Main_tab_View()
        .preferredColorScheme(.dark)
}
