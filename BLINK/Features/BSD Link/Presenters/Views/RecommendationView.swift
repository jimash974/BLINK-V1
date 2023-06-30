//
//  RecommendationView.swift
//  BLINK
//
//  Created by Dwianditya Hanif Raharjanto on 27/06/23.
//

import SwiftUI

struct RecommendationView: View {
    @State private var isOn = false
    @StateObject var scheduleViewModel = ScheduleViewModel()
    @Binding var time:String
    var startHalte: String
    var finishHalte: String
    var data: [Schedule]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bgRecom")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color(red: 1, green: 1, blue: 1))
                            .frame(width: 350, height: 151)
                        HStack {
                            VStack{
                                Image("TripIcon")
                                Image("time")
                                    .font(.system(size: 30.0))
                                    .padding(.top,10)
                            }
                            .padding(.trailing,5)
                            VStack(alignment: .leading){
                                Text("\(startHalte)")
                                Divider()
                                    .frame(width: 270, height: 0)
                                    .overlay(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                                Text("\(finishHalte)")
                                    .padding([.top,.bottom],10)
                                Divider()
                                    .frame(width: 270, height: 0)
                                    .overlay(Color(red: 0, green: 0, blue: 0).opacity(0.7))
                                Text("\(time)")
                                    .padding(.top,10)
                            }
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                        }
                    }
                    Button  {
                        isOn.toggle()
                    } label: {
                        HStack{
                            Image("bookmark")
                            Text(isOn ? "Route Bookmarked" : "Bookmark Route")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                        }
                        .padding(20)
                        .frame(width: 350, height: 40)
                        .background(isOn ? AppColor.orange : AppColor.PUGrey)
                        .cornerRadius(10)
                        .shadow(radius: 5, y: 5)
                    }
                    Text("Nearest Departure Time")
                        .padding(.top,15)
                        .padding(.leading,25)
                        .font(.system(size: 17, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(data) {each in
                                NavigationLink{
                                    DetailRoute()
                                } label: {
                                    TemplateListofRoute(time: "13.00", routeName: each.alias, routeDetail: each.namaRute)
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                    }
                }
            }
    //            .font(.system(size: 20))
            .navigationBarTitle("Schedule Recommendations", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButtonComponent())
            
        }
        .onAppear(){
            print("!")
            scheduleViewModel.dateString = time
            scheduleViewModel.dateString2 = "15:00"
            scheduleViewModel.calculateTimeDifference()
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(startHalte: "wkkw", finishHalte: "wkkw", time:Binding.constant("10:00"), data: dummySched)
    }
}
