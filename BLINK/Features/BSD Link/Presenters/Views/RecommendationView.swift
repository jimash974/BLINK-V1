//
//  RecommendationView.swift
//  BLINK
//
//  Created by Dwianditya Hanif Raharjanto on 27/06/23.
//

import SwiftUI

struct RecommendationView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color(red: 1, green: 1, blue: 1))
                    .frame(width: 350, height: 151)
                HStack {
                    VStack{
                        Image(systemName: "clock.fill")
                            .font(.system(size: 30.0))
                        Group{
                            Image(systemName: "clock.fill")
                                .font(.system(size: 4))
                            Image(systemName: "clock.fill")
                                .font(.system(size: 4))
                            Image(systemName: "clock.fill")
                                .font(.system(size: 4))
                        }.foregroundColor(Color(red: 0.898, green: 0.898, blue: 0.914))
                        Image(systemName: "clock.fill")
                            .font(.system(size: 30.0))
                        Image(systemName: "clock.fill")
                            .font(.system(size: 30.0))
                            .padding(.top,9)
                    }
                    .padding(.trailing,5)
                    VStack(alignment: .leading){
                        Text("The Breeze")
                            .padding(.bottom,4)
                        Divider()
                            .frame(width: 270, height: 0)
                            .overlay(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                            .padding(.bottom,5)
                        Text("Terminal Intermoda")
                        Divider()
                            .frame(width: 270, height: 0)
                            .overlay(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                            .padding(.top,5)
                        Text("13:10")
                            .padding(.top,4)
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                }
            }
            Toggle("Filter", isOn: $isOn)
                        .toggleStyle(.button)
                        .tint(.mint)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
