//
//  AppManager.swift
//  BLINK
//
//  Created by Felix Natanael on 26/06/23.
//

import Foundation
import CoreData
import SwiftUI


class AppManager : ObservableObject {
    @Environment(\.managedObjectContext) var dbContext
    @Environment (\.dismiss) var dismiss
    @Published var pilihJam = Date()
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults <Item>
    
    var halteAwal = ""
    var halteAkhir = ""
    var jam = ""
    
    
    func formattedTime(date: Date) -> String {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
    
    
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
    
    func showResult (rute : String, halteAwal : String, halteAkhir : String, jam : String) {
            
            let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
            let predicate = NSPredicate(format: "rute == %@ && halteAwal == %@ && halterAkhir == %@ && jam == %@", rute,halteAwal,halteAkhir,jam)
            
            fetchRequest.predicate = predicate
            
            do{
                let results = try dbContext.fetch(fetchRequest)
                
                if(results.count > 0){
                    
                    print ("data udah ada")
                    
                    return
                    
                }else{
                    
                    let newBookmark = Item(context: dbContext)
                    
                    newBookmark.rute = rute
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


}







