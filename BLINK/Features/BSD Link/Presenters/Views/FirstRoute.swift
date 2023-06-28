//
//  CartList.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//


import SwiftUI

struct FirstRoute: View {
    var halte: String = "a"
    var jam: String  = "13.00"
    var isFirst: Bool = true
    var isEnd: Bool = false
    
    var body: some View {
        
        HStack() {
//            VStack {
//                Text(jam)
//                    .padding(.bottom,50)
//            }
//            .padding()
            
            
                if isFirst {
                    
                    
                        
                        HStack {
                            VStack {
                                Text(jam)
                                    .padding(.bottom,50)
                            }
                            .padding()
                            
                            VStack (spacing: -5) {
                                Image("bus")
                                    .renderingMode(.template)
                                .foregroundColor(.blue)
                                
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
                    
                } else if isEnd {
                    HStack {
                        VStack {
                            Text(jam)
                                .padding(.bottom,50)
                        }
                        .padding()
                        
                        Image("destination")
                            .renderingMode(.template)
                        .foregroundColor(.red)
                    .padding(.bottom, 50)
                        
                        VStack {
                            Text(halte)
                                .padding(.bottom,50)
                        }
                        .padding()
                    }
                }
            else {
                HStack {
                    VStack {
                        Text(jam)
                            .padding(.bottom,50)
                    }
                    .padding()
                    
                    VStack (spacing: 13) {
                            Circle()
                                .stroke(Color.orange, lineWidth: 10)
                            .frame(width: 20, height: 20)
                            
                        Rectangle()
                            .frame(width: 5, height: 50)
                            .foregroundColor(Color.black)
                            .padding(.top,-10)
                            
                    }
                    VStack {
                        Text(halte)
                            .padding(.bottom,50)
                    }
                    .padding()
                    
                }
                    
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
        FirstRoute()
    }
}
