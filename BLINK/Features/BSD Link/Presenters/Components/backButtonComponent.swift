//
//  backButtonComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 28/06/23.
//

import SwiftUI

struct backButtonComponent: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("backButton")
                .imageScale(.large)
        }
        .padding()
        .foregroundColor(.blue)
    }
}


struct backButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        backButtonComponent()
    }
}
