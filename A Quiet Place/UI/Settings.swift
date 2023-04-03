//
//  Settings.swift
//  A Quiet Place
//
//  Created by Zara Glynn on 3/4/2023.
//

import SwiftUI

struct Settings: View {
    @State var isOpen: Bool = false
    @State var colorSelection: [Color] = [
        .purple,
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .teal,
        .blue
    ]
    @Binding public var colors: [Color]
    
    var body: some View {
        HStack(alignment: .bottom){
            Button( action: {
                self.isOpen.toggle()
            }){
                Group {
                    Text("Change Background Color")
                    .padding()
                }
            }
            .foregroundColor(.black)
            .sheet(isPresented: $isOpen) {
                VStack(spacing: 15) {
                    HStack {
                        ForEach(Array(zip(colors.indices, colors)), id: \.1) { index, color in
                            Text("\(String(describing :color).capitalized)")
                            Circle()
                                .fill(color)
                                .frame(width:25, height:25)
                        }
                    }
                }.padding()
                  
                HStack {
                    Text("Top")
                    ForEach(colorSelection, id: \.self) { color in
                        Button(action: {
                            self.colors[0] = color
                        }) {
                            Circle()
                                .fill(color)
                                .frame(width:25, height:25)
                        }
                    }
                }
                HStack {
                    Text("Bottom")
                    ForEach(colorSelection, id: \.self) { color in
                        Button(action: {
                            self.colors[1] = color
                        }) {
                            Circle()
                                .fill(color)
                                .frame(width:25, height:25)
                        }
                    }
                }
                Spacer()
                HStack {
                    Button(action: {
                        self.colors[0] = Color.purple
                        self.colors[1] = Color.pink
                    }) {
                        Text("Reset")
                        .padding()
                    }
                    
                    Spacer()
                    
                    Button( action: {
                        self.isOpen.toggle()
                    }) {
                        Text("Close")
                        .padding()
                    }
                }
                .foregroundColor(.black)
            }
            .padding()
        }
    }
}
