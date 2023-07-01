//
//  ButtonComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 25/06/23.
//

import SwiftUI

struct ButtonComponent: View {
    var text: String
    var image: String
    
    var body: some View {
        Button  {
            print("clicked")
        } label: {
            HStack{
                Image(image)
                    .opacity(0.5)
                Text(text)
                    .font(.system(size: 17))
                    .foregroundColor(.black)
                    .opacity(0.5)
            }
            .padding(20)
            .frame(width: 327, height: 50)
            .background(AppColor.PUGrey)
            .cornerRadius(10)
            .shadow(radius: 5, y: 5)
        }

    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(text: "text", image: "search")
    }
}
