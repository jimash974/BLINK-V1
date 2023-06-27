//
//  DetailRoute.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//

import SwiftUI

struct DetailRoute: View {
    let jam = ["13.06","13.07","14.00","15.00"]
    let halte = ["a","b","c","d"]
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Text("Schedule Recommendation")
                    .font(.title)
                    .padding()
                    .bold()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 350, height: 150)
                    HStack{
                        VStack{
                            Image("bus")
                            Text("13.06")
                        }
                        .padding()
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.teal)
                                            .frame(width: 250, height: 50)
                                Text("BSD Link De Park 1")
                            }
                            
                            Text("Intermoda - De Park 1 - Intermoda")
                        }
                    }
                    
                }
                Spacer()
                ScrollView{
                    VStack (spacing: -30) {
                        ForEach(Array(zip(halte,jam)), id: \.0) { item,jam in
                            CartList(jam: jam, halte: item)
                        }
                    }
                }
            }
            
            
            
            
        }
    }
}

struct DetailRoute_Previews: PreviewProvider {
    static var previews: some View {
        DetailRoute()
    }
}
