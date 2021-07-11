//
//  CustomButton.swift
//  SlideMenuSwiftUI
//
//  Created by Mac on 10/07/2021.
//

import SwiftUI

struct CustomButton: View {
    
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.spring()) {
                selectedTab = title
                showMenu = false
            }
            
        }, label: {
            
            HStack(spacing: 10) {
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .padding(.vertical,12)
            .padding(.horizontal,10)
            .background(
                
                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                    .opacity(selectedTab == title ? 1 : 0)
                    .clipShape(CustomCorners(corners: [.topRight,.bottomRight], radius: 10))
            )
        })
    }
}

struct CustomCorners: Shape {
    
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
