//
//  HomePage.swift
//  BLINK
//
//  Created by Jeremy Christopher on 25/06/23.
//

import SwiftUI

struct HomePage: View {
    @State var pickUp: String = "Set starting bus stop"
    @State var destination: String = "Set destination bus stop"
    @State private var time: String = "Set Departure Time"
    let pickUpBM = ["Eternity", "Edutown 1", "The Breeze", "Extreme Park", "The Breeze"]
    let destBM = ["Puspita Loka", "Greenwich Park Office", "Verdant View", "Casa de Parco", "Terminal Intermoda"]
    let timeBM = ["15:00", "08:00", "17:00", "19:00", "13:00"]
    
    @EnvironmentObject var sheetManager:SheetManager
    
    @State var isPopUp = false
    @State var isPopUpTime = false
    @State var selectedHalte = ""
    @State var flag = 0
    
    @StateObject var scheduleVM = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 0){
                    HStack(alignment: .center){
                        VStack(alignment: .leading, spacing: 20){
                            Text(prompt.homepage.title)
                                .font(.system(size: 34, weight: .bold))
                            Text(prompt.homepage.description)
                                .font(.system(size: 14))
                        }
                        .padding(.leading, 20)

                        Image("mascot")
                    }
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 10){
                           Image("TripIcon")
                                
                            VStack(alignment: .leading, spacing: 15){
                                
                                Button {
                                    withAnimation {
                                        flag = 0
                                       isPopUp = true
                                    }
                                } label: {
                                    HStack{
                                        Text("\(pickUp)")
                                            .foregroundColor(pickUp != "Set starting bus stop" ? .black : .gray)
                                        Spacer()
                                    }
                                    .frame(width: 200)
                                }
                                .padding(.trailing, 30)
                                
                                Divider()
                                 .frame(width: 220, height: 1)
                                 .background(AppColor.grey)

                                Button {
                                    withAnimation {
                                        flag = 1
                                       isPopUp = true
                                    }
                                } label: {
                                    HStack{
                                        
                                        Text("\(destination)")
                                            .foregroundColor(destination != "Set destination bus stop" ? .black : .gray)
                                        Spacer()
                                    }
                                    .frame(width: 200)
                                }
                            }
                            Image("reverse")
                                .frame(width: 40, height: 40)
                                .background(AppColor.grey)
                                .cornerRadius(10)
                                .onTapGesture {
                                    let temp = pickUp
                                    pickUp = destination
                                    destination = temp
                                }
                        }
                        .frame(width: 307, height: 111)
                        .padding([.leading,.trailing],10)
//                        .padding([.top, .bottom], 15)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        
                        HStack{
                            Image("time")
                                .padding(.leading,10)
                            Button {
                                withAnimation {
                                   isPopUpTime = true
                                }
                            } label: {
                                HStack{
                                    Text("\(time)")
                                        .foregroundColor(time != "Set Departure Time" ? .black : .gray)
                                    Spacer()
                                }
                                .frame(width: 200)
                            }
                            Spacer()
                        }
                        .frame(width: 327, height: 50)
//                        .padding(.leading, 25)
//                        .padding([.top, .bottom], 15)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        if pickUp != "" && pickUp != "Set starting bus stop" && destination != "" && destination != "Set destination bus stop" && time != "Set Departure Time" && time != ""{
                            NavigationLink{
                                RecommendationView(time: $time, startHalte: pickUp, finishHalte: destination, data: content, chosenTime:"11:00")
                            } label: {
                                HStack{
                                Image("search")
                                Text("View Bus Schedule")
                                    .font(.system(size: 17))
                                    .foregroundColor(.black)
                            }
                            .padding(20)
                            .frame(width: 327, height: 50)
                            .background(AppColor.orange)
                            .cornerRadius(10)
                            .shadow(radius: 5, y: 5)
                            }
                        }
                        else{
                            ButtonComponent(text: "View Bus Schedule", image: "search")
                        }

                    }
                    .padding(15)
                    .background(AppColor.grey)
                    .cornerRadius(10)
                    
                    HStack{
                        Text(prompt.homepage.bookmark)
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                    }
                    .padding([.leading, .top],20)
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 20) {
                            ForEach(Array(pickUpBM.indices), id: \.self) { index in
                                BookmarkComponent(time: timeBM[index], pickUp: pickUpBM[index], dest: destBM[index])
                            }

                        }
                        .padding()
                    }
                    
                    Spacer()
                }
                .padding(.top, 35)
                if isPopUp {
                       Color.black
                           .opacity(0.5)
                           .edgesIgnoringSafeArea(.all)
                           .onTapGesture {
                               withAnimation {
                                   isPopUp.toggle()
    //                               print(selectedHalte)
    //                               if flag == 0{
    //                                   pickUp = selectedHalte
    //                               }else if flag == 1{
    //                                   destination = selectedHalte
    //                               }
                               }
                           }
                   }
                else if isPopUpTime {
                       Color.black
                           .opacity(0.5)
                           .edgesIgnoringSafeArea(.all)
                           .onTapGesture {
                               withAnimation {
                                   isPopUpTime.toggle()
                                   
                               }
                           }
                   }
                
            }
            .overlay(alignment: .bottom){
                if isPopUp{
                    if flag == 0{
                        PopUpHalteComponent(selectedHalte: $pickUp)
                    }else if flag == 1{
                        PopUpHalteComponent(selectedHalte: $destination)
                    }
                }else if isPopUpTime{
                    PopUpTimeComponent(time: $time)
                }
        }
        }
        .onAppear(){
            scheduleVM.listEstimatedTime()
            print(scheduleVM.listTime)
        }
        
    }
    
    var content: [Schedule] {
        return schedule.filter {
            $0.startHalte.contains(pickUp) &&
            $0.finishHalte.contains(destination)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(SheetManager())
    }
}
