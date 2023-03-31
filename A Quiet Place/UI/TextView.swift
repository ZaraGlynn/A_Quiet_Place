//
//  TextView.swift
//  A Quiet Place
//
//  Created by Zara Glynn on 31/3/2023.
//

import SwiftUI

extension VerticalAlignment {
    private enum MyAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let myAlignment = VerticalAlignment(MyAlignment.self)
}

struct TextView: View {
    @State var showText: Bool = false
    @State var userInput: String = ""
    @State var tmpInput: String = ""
    
    var body: some View {
        VStack {
                TextField (
                    "Hello World", text: $userInput
                )
                .padding()
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    withAnimation(.spring()) {
                        
                        tmpInput = userInput
                        userInput = ""
                        self.showText.toggle()
                    }
                }
           
                if (tmpInput.count > 0) {
                    HStack {
                        Text(tmpInput)
                    }
                    .border(.black)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
                }
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
