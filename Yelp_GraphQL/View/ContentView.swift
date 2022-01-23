//
//  ContentView.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 22/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sharedFiles = SharedFiles()
    var body: some View {
        UITableView.appearance().backgroundColor = .clear
        return NavigationView{
            ZStack{
                Color("DarkGrey").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical,showsIndicators: false){
                    if sharedFiles.loading{
                        ProgressView()
                    }else {
                        LazyVGrid(columns:[GridItem(),GridItem()]){
                            ForEach(sharedFiles.sharedFiles.business ?? [],id:\.?.id){item in
                                NavigationLink(destination: {DetailView(sharedEntity: Entity(name: item?.name ?? "", url: item?.url ?? "", photo: ((item?.photos?.first ?? "") ?? ""), latitude: (item?.coordinates?.latitude ?? 0.0), longitude: (item?.coordinates?.longitude ?? 0.0)))}, label: {
                                    CardView(sharedEntity: Entity(name: item?.name ?? "", rating: item?.rating ?? 0.0, review_count: item?.reviewCount ?? 0))
                                })
                            }
                        }.padding(10)
                    }
                }
            }.navigationBarTitle(Text("France"),displayMode: .inline)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
