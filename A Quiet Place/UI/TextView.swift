//
//  TextView.swift
//  A Quiet Place
//
//  Created by Zara Glynn on 31/3/2023.
//

import SwiftUI

struct TextView: View {
    @State var textOpacity: Double = 1
    @State var userInput: String = ""
    @State var text: String = ""
    
    var showText: Bool {
        textOpacity < 1
    }
    
    var body: some View {
        VStack(alignment: .center) {
                TextField (
                    "Hello World", text: $userInput
                )
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    withAnimation(.spring()) {
                        text = userInput
                        userInput = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeOut(duration: 2)){
                                textOpacity = 0
                            }
                        }
                    }
                }
           
                if text.count > 0 && showText {
                    Text(text)
                    .border(.black)
                    .offset(x: 0, y: textOpacity == 1 ? 0 : UIScreen.main.bounds.height)
                    .animation(.easeInOut(duration: 2), value: textOpacity)
                    .onChange(of: textOpacity) { newValue in
                        if newValue == 0 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)  {
                                textOpacity = 1
                            }
                        }
                        
                    }
                }
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
