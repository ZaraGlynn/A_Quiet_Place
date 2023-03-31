//
//  MainView.swift
//  A Quiet Place
//
//  Created by Zara Glynn on 31/3/2023.
//

import SwiftUI

struct MainView: View {
    @State var userInput: String = ""
    @State var isOpen: Bool = false
    @State var color1 = Color.pink
    @State var color2 = Color.purple
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(
                    gradient: Gradient(
                    colors: [color1, color2]),
                    startPoint: .top,
                    endPoint: .bottom
                
                ))
                .ignoresSafeArea()
           
            VStack {
                VStack {
                        TextField (
                            "Hello World", text: $userInput
                        )
                        .padding()
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                    }
                VStack { 
                    HStack{
                        Button( action: {
                            self.isOpen.toggle()
                        }){
                            if !isOpen {
                                Text("Change Background Color")
                                .foregroundColor(.black)
                            } else {
                                Text("Close")
                                .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                    .buttonStyle(.bordered)
                    
                    HStack {
                        if isOpen {
                            ColorPicker("First Colour", selection: $color1)
                            ColorPicker("Second Colour ", selection: $color2)
                        }
                    }
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
