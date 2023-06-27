//
//  TemplateListofRoute.swift
//  BLINK
//
//  Created by Dwianditya Hanif Raharjanto on 27/06/23.
//

import SwiftUI

struct TemplateListofRoute: View {
    var time: String
    var routeName: String
    var routeDetail: String
        
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color(red: 1, green: 1, blue: 1))
                    .frame(width: 350, height: 100)
                HStack {
                    VStack{
                        Image(systemName: "clock.fill")
                            .font(.system(size: 30.0))
                        Text("\(time)")
                            .font(.system(size: 17, weight: .semibold))
                            .padding([.top,.trailing],2)
                    }
                    VStack(alignment: .leading){
                        ZStack{
                            RoundedRectangle(cornerRadius: 200.0)
                                .fill(Color(red: 1, green: 0.604, blue: 0.675))
                                .frame(width: 250, height: 32)
                            Text("\(routeName)")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                        }
                        Text("\(routeDetail)")
                            .font(.system(size: 17))
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
}

struct TemplateListofRoute_Previews: PreviewProvider {
    static var previews: some View {
        TemplateListofRoute(time: "13.10", routeName: "BSD Link Sektor 1.3", routeDetail: "Intermoda - Sektor 1.3 - Intermoda")
    }
}
