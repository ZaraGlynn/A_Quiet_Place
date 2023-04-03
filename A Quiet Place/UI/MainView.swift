//
//  MainView.swift
//  A Quiet Place
//
//  Created by Zara Glynn on 31/3/2023.
//

import SwiftUI

struct MainView: View {
    @State var colors: [Color] = [
        .purple,
        .pink
    ]
    @State public var viewHeight: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(
                        gradient: Gradient(
                        colors: [colors[0], colors[1]]),
                        startPoint: .top,
                        endPoint: .bottom
                    
                    ))
                    .ignoresSafeArea()
                    .overlay(
                        Color.clear.onAppear {
                            self.viewHeight = geometry.size.height
                        }
                    )                
               
                VStack {
                    Spacer()
                    TextView()
                    Spacer()
                    Settings(colors: $colors)
                    
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
