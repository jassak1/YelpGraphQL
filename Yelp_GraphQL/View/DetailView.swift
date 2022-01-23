//
//  DetailView.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 23/01/2022.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @StateObject private var saveImage = SaveImage()
    @State private var showSheet = false
    @State private var placeImage = UIImage(imageLiteralResourceName: "Placeholder")
    @State private var pinMap:[PinMap]
    @State var sharedEntity:Entity
    var body: some View {
        let coordinates = Binding<MKCoordinateRegion>(
            get: {MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: sharedEntity.latitude, longitude: sharedEntity.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))},
            set:{_ in}
        )
        ZStack{
            Color("DarkGrey").edgesIgnoringSafeArea(.all)
            VStack{
                Map(coordinateRegion: coordinates, annotationItems: pinMap){marker in
                    MapMarker(coordinate: marker.location,tint: .accentColor)
                }.frame(maxWidth:.infinity,maxHeight: .infinity).clipShape(RoundedRectangle(cornerRadius: 10)).padding()
                Image(uiImage: placeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:.infinity,maxHeight: .infinity).clipShape(RoundedRectangle(cornerRadius: 10)).padding()
                    .background(Color("DarkGrey"))
                    .onTapGesture {
                        saveImage.savePhoto(image: placeImage)
                    }
            }
        }.navigationBarTitle(Text("\(sharedEntity.name)"),displayMode: .inline)
            .toolbar(content: {ToolbarItem(placement: .navigationBarTrailing, content: {Button(action: {showSheet=true}, label: {Image(systemName: "info.circle")})})})
            .sheet(isPresented: $showSheet){
                WebView(url: URL(string: sharedEntity.url)!)
            }
            .alert(isPresented: $saveImage.showAlert){
                Alert(title: Text("Image saved"), message: Text("Selected image was saved successfully"), dismissButton: .default(Text("OK")))
            }
            .onAppear(perform: {
                Task{
                    do{
                        self.placeImage = try await ImageAsync.shared.loadImage(url: sharedEntity.photo)
                    } catch{
                        placeImage = UIImage(imageLiteralResourceName: "Placeholder")
                        print(error.localizedDescription)
                    }
                }
            })
    }
    init(sharedEntity:Entity){
        self.sharedEntity = sharedEntity
        pinMap = [PinMap(name: sharedEntity.name, location: CLLocationCoordinate2D(latitude: sharedEntity.latitude, longitude: sharedEntity.longitude))]
        
    }
}

