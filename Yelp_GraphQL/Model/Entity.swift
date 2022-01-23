//
//  Entity.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 23/01/2022.
//

import Foundation
import MapKit

struct Entity{
    let name:String
    let rating:Double
    let review_count:Int
    let url:String
    let photo:String
    let latitude:Double
    let longitude:Double
    
    init(){
        name = String()
        rating = Double()
        review_count = Int()
        url = String()
        photo = String()
        latitude = Double()
        longitude = Double()
    }
    
    init(name:String, rating:Double, review_count:Int){
        self.name = name
        self.rating = rating
        self.review_count = review_count
        url = String()
        photo = String()
        latitude = Double()
        longitude = Double()
    }
    
    init(name:String, url:String, photo:String, latitude:Double, longitude:Double){
        self.url = url
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        rating = Double()
        review_count = Int()
    }
}

struct PinMap:Identifiable{
    let id = UUID()
    let name:String
    let location:CLLocationCoordinate2D
}
