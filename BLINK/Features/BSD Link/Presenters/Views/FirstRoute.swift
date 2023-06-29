//
//  CartList.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//


import SwiftUI

struct FirstRoute: View {
    var halte: String
    var jam: String
    var isFirst: Bool
    var isEnd: Bool
    
    var body: some View {
        
        HStack() {
//            VStack {
//                Text(jam)
//                    .padding(.bottom,50)
//            }
//            .padding()
                if isFirst {
                    HStack(alignment: .top ,spacing:0){
                        Text(jam)
                            .padding([.leading, .trailing], 22)
                        VStack (spacing: -3) {
                            Image("startBus")
                                
                            Rectangle()
                                .frame(width: 5, height: 50)
                                .foregroundColor(Color.black)
                        }
                        HStack{
                            VStack(alignment: .leading){
                                Text("Start from")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                    .opacity(0.3)
                                Text(halte)
                            }
                            Spacer()
                        }
                        .frame(width: 200)
                    }
                    .padding(.leading, 13)
                    .padding(.top, 30)
                    
                } else if isEnd {
                    HStack(alignment: .top ,spacing:0){
                        Text(jam)
                            .padding([.leading, .trailing], 22)
                        VStack (spacing: -3) {
                            Image("destination")
                                

                        }
                        HStack{
                            VStack(alignment: .leading){
                                Text("Reach Destination")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                    .opacity(0.3)
                                Text(halte)
                            }
                            Spacer()
                        }
                        .frame(width: 200)
                    }
                    .padding(.leading, 13)
                    .padding(.top, 30)
                }
            else {
                HStack(alignment: .top,spacing: 10){
                    Text(jam)
                        .padding([.leading, .trailing], 20)
                    VStack (spacing: 4) {
                            Circle()
                                .stroke(Color.orange, lineWidth: 10)
                                .frame(width: 20, height: 20)
                            
                        Rectangle()
                            .frame(width: 5, height: 50)
                            .foregroundColor(Color.black)
                    }
                    HStack{
                        Text(halte)
                        Spacer()
                    }
                    .frame(width: 200)
                }
                .padding(.trailing, -15)
                .padding(.top, 30)
            }
                
//                Circle()
//                    .stroke(Color.blue, lineWidth: 10)
//                    .frame(width: 20, height: 20)
                
                
            
            
//            VStack {
//                Text(halte)
//                    .padding(.bottom,50)
//            }
//            .padding()
        }
    }
}

struct FirstRoute_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:-30){
            FirstRoute(halte: "The Breeze", jam: "13:00", isFirst: true, isEnd: false)
            FirstRoute(halte: "Intermoda", jam: "13:00", isFirst: false, isEnd: false)
            FirstRoute(halte: "SML", jam: "13:00", isFirst: false, isEnd: false)
            FirstRoute(halte: "AEON", jam: "16:06", isFirst: false, isEnd: true)
        }
        
    }
}
