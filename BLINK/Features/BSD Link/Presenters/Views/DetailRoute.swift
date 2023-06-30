//
//  DetailRoute.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//

import SwiftUI

struct Jadwal: Hashable {
    var jam: String
    var halte: String
    var isFirst: Bool
    var isEnd: Bool
}

let DataJadwal: [Jadwal] = [
    Jadwal(jam: "13.06", halte: "The Breeze", isFirst: true, isEnd: false),
    Jadwal(jam: "15.06", halte: "Intermoda", isFirst: false, isEnd: false),
    
    Jadwal(jam: "15.06", halte: "The Breeze", isFirst: false, isEnd: false),
    
    Jadwal(jam: "15.06", halte: "SML", isFirst: false, isEnd: false),
    Jadwal(jam: "16.06", halte: "AEON", isFirst: false, isEnd: true)
]

struct DetailRoute: View {
    @State var count = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("DetailBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(){
//                    Text("Schedule Recommendation")
//                        .font(.title)
//                        .padding()
//                        .bold()
                    TemplateListofRoute(time: "13.00", routeName: "De Park 1", routeDetail: "Intermoda - Sektor 1.3 - Intermoda")
                    Spacer()
                    ScrollView{
                        HStack{
                            VStack (spacing: -30) {
                                ForEach(DataJadwal, id: \.self) { item in
                                    FirstRoute(halte: item.halte, jam: item.jam, isFirst: item.isFirst, isEnd: item.isEnd)
                                }

        //
        //                        ForEach(Array(zip(halte,jam, isFirst)), id: \.0) { item,jam, isFirst in
        //                            FirstRoute(isFirst: isFirst)
        ////
        ////                            if count == 1 {
        ////                                FirstRoute()
        ////
        ////                            } else {
        ////                                CartList(jam: jam, halte: item)
        ////                            }
        //
        //
        //
        //                        }
                            }
                         Spacer()
                        }
                    }
                    .padding(.top, 30)
    //                SwipeItem(content: {
    //                            Text("Exhibit 1")
    //                         },
    //                         left: {
    //                            ZStack {
    //                                Rectangle()
    //                                    .fill(Color.orange)
    //
    //                                Image(systemName: "pencil.circle")
    //                                    .foregroundColor(.white)
    //                                    .font(.largeTitle)
    //                            }
    //                         },
    //                         right: {
    //                            ZStack {
    //                                Rectangle()
    //                                    .fill(Color.red)
    //
    //                                Image(systemName: "trash.circle")
    //                                    .foregroundColor(.white)
    //                                    .font(.largeTitle)
    //                            }
    //                         }, itemHeight: 50)
                }
            }
            .navigationBarTitle("Schedule Recommendations", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButtonComponent())
        }
    }
}

struct DetailRoute_Previews: PreviewProvider {
    static var previews: some View {
        DetailRoute()
    }
}
