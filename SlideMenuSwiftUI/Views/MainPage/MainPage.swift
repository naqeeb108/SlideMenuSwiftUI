//
//  Home.swift
//  SlideMenuSwiftUI
//
//  Created by Mac on 10/07/2021.
//

import SwiftUI

struct MainPage: View {
    
    @Binding var selectedTab: String
    
    init(selectedTab: Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Home()
                .tag("Home")
            
            History()
                .tag("History")
            
            Notifications()
                .tag("Notifications")
            
            Settings()
                .tag("Settings")
            
            Help()
                .tag("Help")
        }
    }
}
