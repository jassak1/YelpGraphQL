//
//  CardView.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 23/01/2022.
//

import SwiftUI

struct CardView: View {
    @State var sharedEntity:Entity
    var body: some View {
        VStack(alignment:.leading) {
            VStack(alignment: .leading){
                Text("\(sharedEntity.name)")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth:140, alignment: .leading)
                Spacer()
                HStack(spacing:1){
                    ForEach(0..<5){star in
                        Image(systemName: "star.square.fill")
                            .background(Color("DarkGrey"))
                            .foregroundColor((star<Int(sharedEntity.rating)) ? .red : .gray)
                    }
                }
                Text("Based on \(sharedEntity.review_count) Reviews")
                    .font(.caption2)
            }.frame(width:  160,height: 120)
        }.padding(5).overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth:2)).foregroundColor(.gray)
    }
}

