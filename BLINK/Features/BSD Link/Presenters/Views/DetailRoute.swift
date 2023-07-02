//
//  DetailRoute.swift
//  BLINK
//
//  Created by Felix Natanael on 27/06/23.
//

import SwiftUI

//struct Jadwal: Hashable {
//    var jam: String
//    var halte: String
//    var isFirst: Bool
//    var isEnd: Bool
//}
//
//let DataJadwal: [Jadwal] = [
//    Jadwal(jam: "13.06", halte: "The Breeze", isFirst: true, isEnd: false),
//    Jadwal(jam: "15.06", halte: "Intermoda", isFirst: false, isEnd: false),
//
//    Jadwal(jam: "15.06", halte: "The Breeze", isFirst: false, isEnd: false),
//
//    Jadwal(jam: "15.06", halte: "SML", isFirst: false, isEnd: false),
//    Jadwal(jam: "16.06", halte: "AEON", isFirst: false, isEnd: true)
//]

struct DetailRoute: View {
    @State var count = 0
    var routeName: String
    var routeDetail: String
    var time: String
    var listOfTime: [String]
    var rute: [String]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("DetailBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack(){
                    TemplateListofRoute(time: time, routeName: routeName, routeDetail: routeDetail)
                    ScrollView{
                        HStack{
                            VStack (spacing: -30) {
                                ForEach(Array(rute.enumerated()), id: \.element.self) { index, item in
                                    if index == 0 {
                                        FirstRoute(halte: item, jam: listOfTime[index], isFirst: true, isEnd: false)
                                    } else if index < rute.count-1 {
                                        FirstRoute(halte: item, jam: listOfTime[index], isFirst: false, isEnd: false)
                                    }
                                    else {
//                                        print("terakhir")
                                        FirstRoute(halte: item, jam: listOfTime[index], isFirst: false, isEnd: true)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.leading,-65)
                }
            }
            .navigationBarTitle("Detail Routes", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButtonComponent())
        }
    }
}

struct DetailRoute_Previews: PreviewProvider {
    static var previews: some View {
        DetailRoute(routeName: "BSD Link De Park 1", routeDetail: "Intermoda - De Park 1 - Intermoda", time: "13.00", listOfTime: ["11:00","12:00","13:00","11:00","12:00","13:00"], rute: ["The Breexe","Semarang","Zarfa Naida","halo","hai","wkwk"])
//        DetailRoute(routeName: "BSD Link De Park 1", routeDetail: "Intermoda - De Park 1 - Intermoda", time: "13.00", listOfTime: ["11:00","12:00","13:00"], rute: ["The Breexe","Semarang","Zarfa Naida"])
    }
}
