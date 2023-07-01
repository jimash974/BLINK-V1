//
//  CartList.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//


import SwiftUI

struct CartList: View {
    let jam : String
    let halte : String
    var body: some View {
        
        HStack() {
            VStack {
                Text(jam)
                    .padding(.bottom,50)
            }
            .padding()
            
            VStack(spacing: 5) {
                Circle()
                    .stroke(Color.orange, lineWidth: 10)
                    .frame(width: 20, height: 20)
                
                Rectangle()
                    .frame(width: 5, height: 50)
                    .foregroundColor(Color.black)
            }
            
            VStack {
                Text(halte)
                    .padding(.bottom,50)
            }
            .padding()
        }
    }
}

