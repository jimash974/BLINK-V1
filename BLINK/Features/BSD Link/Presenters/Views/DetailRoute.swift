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
    var routeName: String
    var routeDetail: String
    var time: String
    var data: Schedule
    
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
                    TemplateListofRoute(time: time, routeName: routeName, routeDetail: routeDetail)
                    Spacer()
                    ScrollView{
                        HStack{
//                            VStack (spacing: -30) {
//                                ForEach(Array(data.enumerated()), id: \.element.id) { index, item in
//                                    FirstRoute(halte: item.halte, jam: item.jam, isFirst: item.isFirst, isEnd: item.isEnd)
//                                }

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
//                                    SwipeItem(content: {
//                                                Text("Exhibit 1")
//                                             },
//                                             left: {
//                                                ZStack {
//                                                    Rectangle()
//                                                        .fill(Color.orange)
//
//                                                    Image(systemName: "pencil.circle")
//                                                        .foregroundColor(.white)
//                                                        .font(.largeTitle)
//                                                }
//                                             },
//                                             right: {
//                                                ZStack {
//                                                    Rectangle()
//                                                        .fill(Color.red)
//
//                                                    Image(systemName: "trash.circle")
//                                                        .foregroundColor(.white)
//                                                        .font(.largeTitle)
//                                                }
//                                             }, itemHeight: 50)
//                                }
            }
            .navigationBarTitle("Detail Routes", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButtonComponent())
        }
    }
}

struct DetailRoute_Previews: PreviewProvider {
    static var previews: some View {
        DetailRoute(routeName: "KKWKW", routeDetail: "WKWKKW", time: "KWKWKW", data: Schedule(alias: "BSD Link Sektor 1.3", namaRute: "Intermoda - Halte Sektor 1.3", startHalte: "Intermoda", finishHalte: "The Breeze",
                                                                                              rute: ["Intermoda","Cosmo","Verdan View", "Eternity", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE", "GOP 1", "SML Plaza", "The Breeze"],
                                                                                              time: [["06:00","06:04","09:09","09:11","09:15","09:33","09:34","09:45"],["06:30","06:34","09:39","09:41","09:45","10:03","10:04","10:15"],["08:10","10:02","10:09","10:11","10:15","10:33","10:34","10:45"],["08:50","10:32","10:39","10:41","10:45","11:03","11:04","11:15"],["10:25","11:02","11:09","11:11","11:15","11:33","11:34","11:45"],["10:55","11:32","11:39","11:41","11:45","12:03","12:04","12:15"],["12:35","12:02","12.09","12.11","12.15","12:33","12:34","12:45"],["13:05","12:32","12:39","12:41","12:45","13:03","13:04","13:15"],["14:45","13:02","13:09","13:11","13:15","13:33","13:34","13:45"],["15:15","13:32","13:39","13:41","13:45","14:03","14:04","14:15"],["16:50","14:02","14:09","14:11","14:15","14:33","14:34","14:45"],["17:20","14:32","14:39","14:41","14:45","15:03","15:04","15:15"],["18:45","15:02","15:09","15:11","15:15","15:33","15:34","15:45"],["19:25","15:32","15:39","15:41","15:45","16:03","16.04","16:15"]]))
    }
}
