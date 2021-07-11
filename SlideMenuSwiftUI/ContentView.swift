//
//  ContentView.swift
//  SlideMenuSwiftUI
//
//  Created by Mac on 10/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = "Home"
    @State var showMenu = false
    @Namespace var animation
    
    var body: some View {
        
        ZStack {
            
            Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                SlideMenu(selectedTab: $selectedTab, showMenu: $showMenu)

            }
            
            ZStack {
                
                MainPage(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
                
                Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
            }
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                        
                    }
                    
                }, label: {
                    HamburgerIcon(showMenu: showMenu, color1: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), color2: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                    
                })
                .padding()
                ,alignment: .topLeading
                
            )
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? UIScreen.main.bounds.width - 150  : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HamburgerIcon: View {
    
    var showMenu: Bool
    var color1: Color
    var color2: Color
    
    var body: some View {
        
        VStack {
            
            ForEach(1...3, id: \.self) {_ in
                
                Capsule()
                    .fill(showMenu ? color1 : color2 )
                    .frame(width: 30, height: 3)
                
            }
        }
    }
}
