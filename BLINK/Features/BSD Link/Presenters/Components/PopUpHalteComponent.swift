//
//  PopUpHalteComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 27/06/23.
//

import SwiftUI

struct PopUpHalteComponent: View {
    var halte:[String] = ["","AEON Mall 2", "Albera", "Allevare", "Ammarila Lavanya", "Astra", "Auto Part", "BCA", "Bursa Mobil", "Casa de Parco", "CBD Timur 1","CBD Utara 3", "Chadnya", "Club House Avani", "Collinare", "Cosmo", "De Brassia", "De Frangipani", "De Heliconia 1", "De Heliconia 2", "De Maja", "De Nara", "Devina and Desnha", "East Business District", "Edutown", "Eka Hospital 1", "Eka Hospital 2", "Eternity", "Extreme Park", "FBL 1", "FBL 2", "FBL 5", "Fiore", "Foglio", "Foresta 1", "Foresta 2", "Fresco", "Giant", "Giardina", "Intermoda", "ICE","Lobby AEON Mall", "The Breeze" ]
    
    @Binding var selectedHalte:String
    
//    @Binding var flag:Int
//    @Binding var pickUp: String
//    @Binding var Destination: String
//    @Binding var Time: String
    
    
//    let didClose: ()-> Void

    var body: some View {
        VStack(alignment: .center,spacing: 0){
            Picker("Selected Halte", selection: $selectedHalte) {
                ForEach(halte, id: \.self) { halteName in
                           Text(halteName)
                    }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .pickerStyle(.inline)
//            .labelsHidden()
            .overlay(alignment: .top) {
                Text("Starting Bus Stop")
                    .font(.system(size: 17, weight: .semibold))
    //                .position(y:100)
                    .frame(maxWidth: .infinity)
                    .padding([.top,. bottom], 35)
                    .background(.white)
            }
        }
        .background(.white)
        .transition(.move(edge: .bottom))
    }
}

struct PopUpHalteComponent_Previews: PreviewProvider {
    static var previews: some View {
        PopUpHalteComponent(selectedHalte: Binding.constant("Breeze"))
            .previewLayout(.sizeThatFits)
    }
}
