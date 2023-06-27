//
//  PopUpHalteComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 27/06/23.
//

import SwiftUI

struct PopUpHalteComponent: View {
    @State private var minutes: Int = 0
    var halte:[String] = ["Albera", "Allevare", "Ammarila Lavanya", "Astra", "Auto Part", "BCA", "Bursa Mobil", "Casa de Parco", "CBD", "Chadnya", "Club House Avani", "Collinare", "Cosmo", "De Brassia", "De Frangipani", "De Heliconia 1", "De Heliconia 2", "De Maja", "De Nara", "Devina and Desnha", "East Business District", "Edutown", "Eka Hospital 1", "Eka Hospital 2", "Eternity", "Extreme Park", "FBL 1", "FBL 2", "FBL 5", "Fiore", "Foglio", "Foresta 1", "Foresta 2", "Fresco", "Giant", "Giardina" ]
    
    @State private var selectedHalte: String = ""
    
    let didClose: ()-> Void


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
        PopUpHalteComponent{}
            .previewLayout(.sizeThatFits)
    }
}
