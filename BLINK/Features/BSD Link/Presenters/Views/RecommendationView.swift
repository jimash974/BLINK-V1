//
//  RecommendationView.swift
//  BLINK
//
//  Created by Dwianditya Hanif Raharjanto on 27/06/23.
//

import SwiftUI
import CoreData

struct RecommendationView: View {
    @Environment(\.managedObjectContext) var dbContext
    @EnvironmentObject var appManager : AppManager

    @State private var isOn = false
    @StateObject var scheduleViewModel = ScheduleViewModel()
    @Binding var time:String
    var startHalte: String
    var finishHalte: String
    var data: [Schedule]
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults<Item>
    
//    func checkBookmark(
    
    func addBookmark (halteAwal : String, halteAkhir : String, jam : String) {
        
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let predicate = NSPredicate(format: "halteAwal == %@ && halterAkhir == %@ && jam == %@", halteAwal,halteAkhir,jam)
        
        fetchRequest.predicate = predicate
        
        do{
            let results = try dbContext.fetch(fetchRequest)
            
            if(results.count > 0){
                
                deleteSpecificData (halteAwal : halteAwal, halteAkhir : halteAkhir, jam : jam)
                
                return
                
            }else{
                
                let newBookmark = Item(context: dbContext)
                
                newBookmark.halteAwal = halteAwal
                newBookmark.halterAkhir = halteAkhir
                newBookmark.jam = jam
                
                try dbContext.save()
            }
        }catch{
            print("error")
        }
    }
    
    
    func deleteSpecificData (halteAwal : String, halteAkhir : String, jam : String) {
            
            let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
            let predicate = NSPredicate(format: "halteAwal == %@ && halterAkhir == %@ && jam == %@", halteAwal,halteAkhir,jam)
            
            fetchRequest.predicate = predicate
        
            do{
                
                let result = try dbContext.fetch(fetchRequest)
                
                for predicate in result {
                    dbContext.delete(predicate)
                }
                
                try dbContext.save()
                
            }catch{
                print("error")
            }
        }
    
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
                        addBookmark(halteAwal: startHalte, halteAkhir: finishHalte, jam: time)
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
                                ForEach(each.time, id: \.self) {jam in
                                    NavigationLink{
                                        DetailRoute(routeName: each.alias, routeDetail: each.namaRute, time: jam[0], listOfTime: jam, rute: each.rute)
                                    } label: {
                                        SwipeItem(content: {
                                            TemplateListofRoute(time: jam[0], routeName: each.alias, routeDetail: each.namaRute)
                                                .foregroundColor(.black)
                                        },
                                                  left: {
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.orange)
                                                
                                                Image(systemName: "pencil.circle")
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                            }
                                        },
                                                  right: {
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.orange)
                                                
                                                Button(action: {
                                                    let notification = Reminder()
                                                    notification.askPermission() // Request permission to display notifications
                                                    notification.scheduleRecurringNotification(time: jam[0]) // Schedule notification with the chosen time
                                                }){
                                                    Image("Bell")
                                                        .foregroundColor(.white)
                                                        .font(.largeTitle)
                                                        .padding(.leading,10)
                                                    Text("Reminder")
                                                        .fontWeight(.semibold)
                                                        .font(.body)
                                                        .padding(.leading, -5)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        })
                                    }
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
        RecommendationView(time: Binding.constant("10:00"), startHalte: "wkkw", finishHalte: "wkkw", data: dummySched)
    }
}
