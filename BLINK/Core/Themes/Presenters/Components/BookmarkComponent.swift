//
//  BookmarkComponent.swift
//  BLINK
//
//  Created by Jeremy Christopher on 25/06/23.
//

import SwiftUI

struct BookmarkComponent: View {
    var time:String
    var pickUp:String
    var dest:String
    
    var body: some View {
        Button (action: {
            print("test2")
//            RecommendationView()
        }, label: {
            HStack(){
                VStack{
                    Image("bus")
                    Text(time)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                }
                Image("line")
                VStack(alignment: .leading, spacing: 10){
                    Text(pickUp)
                    Text("\(dest)")
                }
                .foregroundColor(.black)
                .font(.system(size: 17))
                Spacer()
            }
            .padding(10)
            .frame(width: 264, height: 80)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5, y: 5)
        })

    }
}

struct BookmarkComponent_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkComponent(time: "15:00", pickUp: "Eternity", dest: "Puspita Lokal")
    }
}
