//
//  HomeTabView.swift
//  App Foundation
//
//  Created by Adriana Palmese on 11/04/25.
//


import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Shop Tab
            Shop()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Shop")
                }
            
            // Achievements Tab
            Archievement()
                .tabItem {
                    Image(systemName: "medal.fill")
                    Text("Achievements")
                }
            
            // Profile Tab
            Profile()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.orange)  // Modifica il colore di selezione dei tab
    }
}

#Preview {
    HomeTabView()
}
