//
//  SlideMenu.swift
//  SlideMenuSwiftUI
//
//  Created by Mac on 10/07/2021.
//

import SwiftUI

struct SlideMenu: View {
    
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    @Namespace var animation
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
            
            Button(action: {
                withAnimation(.spring()) {
                    showMenu.toggle()
                }
            }, label: {
                
                HamburgerIcon(showMenu: showMenu, color1:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), color2: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                
            })
            
            //Profile Picture
            Image("pic")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(50)
                .padding(.top,50)
            
            //profile Name etc
            VStack(alignment: .leading, spacing: 5, content: {
                
                Text("Naqeeb Ahmed")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
            })
            
            //Menu Buttons
            VStack(alignment: .leading, spacing: 10, content: {
                
                CustomButton(image: "house", title: "Home", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                CustomButton(image: "clock.arrow.circlepath", title: "History", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                CustomButton(image: "bell.badge", title: "Notifications", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                CustomButton(image: "gearshape.fill", title: "Settings", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                CustomButton(image: "questionmark.circle", title: "Help", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                CustomButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Logout", animation: animation, selectedTab: $selectedTab, showMenu: $showMenu)
                
                
            })
            .padding(.leading,-15)
            .padding(.top,20)
            
        })
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
