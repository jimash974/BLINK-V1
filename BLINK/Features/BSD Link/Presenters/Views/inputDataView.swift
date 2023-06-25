//
//  inputDataView.swift
//  BLINK
//
//  Created by yuri wardana on 21/06/23.
//

import SwiftUI
import CoreData


struct inputDataView: View {
    
    @Environment(\.managedObjectContext) var dbContext
    @Environment (\.dismiss) var dismiss
    
    
    var rute = ["a", "b", "c", "d","e"]
    var halte = ["Red", "Green", "Blue", "Tartan","pink"]
    var jam = ["09.00","10.00","11.00","12.00","13.00"]
    @State private var pilihRute = "Red"
    @State private var pilihhalteAwal = "Red"
    @State private var pilihhalteAkhir = "Red"
    @State private var pilihJam = "10.00"
    @State private var isBookmarked : Bool = false
    @State private var bK : Bool = false
    
    // bikin strcut isinya rute halteawal halteakhir dan jam
//    struct
//
//    red - pink jam 09.00
//    red - pink jam 10.00
//    red - pink jam 11.00
//    red - pink jam 12.00
//    red - pink jam 13.00
//
    
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults <Item>
    
    var body: some View {
        
        
        
        VStack(spacing: 12) {
            Picker("rute: ", selection: $pilihRute) {
                ForEach(rute, id: \.self) {
                    Text($0)
                    
                }
            }
            .pickerStyle(.menu)
            
            Picker("awal: ", selection: $pilihhalteAwal) {
                ForEach(halte, id: \.self) {
                    Text($0)
                    
                }
            }
            .pickerStyle(.menu)
            
            Picker("akhir: ", selection: $pilihhalteAkhir) {
                ForEach(halte, id: \.self) {
                    Text($0)
                    
                }
            }
            .pickerStyle(.menu)
            
            Picker("jam: ", selection: $pilihJam) {
                ForEach(jam, id: \.self) {
                    Text($0)
                    
                }
            }
            .pickerStyle(.menu)
            
            
            Button {
                
                
            addBookmark (rute : pilihRute, halteAwal : pilihhalteAwal, halteAkhir : pilihhalteAkhir, jam : pilihJam)
            
                
            } label: {
                Text("Save")
                
            }
            
            ScrollView (.horizontal) {
                HStack{
                    ForEach(listofBookmark) { bk in
                        VStack{

                            Text("Rute:" + (bk.rute ?? "not found") )
                            Text("Halte Awal:" + (bk.halteAwal ?? "not found") )
                            Text("Halte Akhir:" + (bk.halterAkhir ?? "not found") )
                            Text("Jam:" + (bk.jam ?? "not found") )
                            //                               }
                        }
                    }
                }
            }
        }
    }
    
    func addBookmark (rute : String, halteAwal : String, halteAkhir : String, jam : String) {
        
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let predicate = NSPredicate(format: "rute == %@ && halteAwal == %@ && halterAkhir == %@ && jam == %@", rute,halteAwal,halteAkhir,jam)
        
        fetchRequest.predicate = predicate
        
        do{
            let results = try dbContext.fetch(fetchRequest)
            
            if(results.count > 0){
                
                deleteSpecificData (rute : pilihRute, halteAwal : pilihhalteAwal, halteAkhir : pilihhalteAkhir, jam : pilihJam)
                
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
    
    func deleteSpecificData (rute : String, halteAwal : String, halteAkhir : String, jam : String) {
        
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        let predicate = NSPredicate(format: "rute == %@ && halteAwal == %@ && halterAkhir == %@ && jam == %@", rute,halteAwal,halteAkhir,jam)
        
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

struct inputDataView_Previews: PreviewProvider {
    static var previews: some View {
        inputDataView()
    }
}
