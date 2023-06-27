//
//  HomePage.swift
//  BLINK
//
//  Created by Jeremy Christopher on 25/06/23.
//

import SwiftUI

struct HomePage: View {
    @State private var pickUp: String = ""
    @State private var Destination: String = ""
    @State private var Time: String = ""
    let pickUpBM = ["Eternity", "Edutown 1", "The Breeze", "Extreme Park", "The Breeze"]
    let destBM = ["Puspita Loka", "Greenwich Park Office", "Verdant View", "Casa de Parco", "Terminal Intermoda"]
    let timeBM = ["15:00", "08:00", "17:00", "19:00", "13:00"]

    
    @EnvironmentObject var sheetManager:SheetManager
    
    var popUp = false
    
    var body: some View {
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
                                    
                                }
                            } label: {
                                Text("Search for a pickup point")
                                    .frame(width: 220)

                            }
                            
                            Divider()
                             .frame(width: 200, height: 1)
                             .background(AppColor.grey)

                            TextField(
                                   "Search for a Destination",
                                   text: $Destination
                               )
                            .frame(width: 220)
                        }
                        Image("reverse")
                            .frame(width: 40, height: 40)
                            .background(AppColor.grey)
                            .cornerRadius(10)
                    }
                    .frame(width: 327, height: 111)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
                    HStack{
                        Image("time")
                        TextField(
                            "Departure time",
                            text: $Time
                        )
                    }
                    .frame(width: 225, height: 50)
                    .padding(.leading, 10)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
                    ButtonComponent(text: "Search", image: "search")
                        .padding(.top, 20)
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
//            on tap gesture here
            
        }
        .overlay(alignment: .bottom){
            if sheetManager.action.isPresented{
                PopUpHalteComponent{
                    sheetManager.dismiss()
                }
            }
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(SheetManager())
    }
}
