//
//  SharedFiles.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 22/01/2022.
//

import Foundation
import UIKit

class SharedFiles:ObservableObject{
    @Published var sharedFiles = FranceQuery.Data.Search()
    @Published var loading = true
    
    @MainActor
    func fetchYelp(){
        Network.shared.apollo.fetch(query: FranceQuery()){result in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
                self.loading = false
            case .success(let data):
                Task{
                    self.sharedFiles = data.data?.search ?? FranceQuery.Data.Search()
                    self.loading = false
                }
            }
        }
    }
    
    init(){
        Task{
            await fetchYelp()
        }
    }
}

class SaveImage:NSObject,ObservableObject{
    @Published var showAlert = false
    func savePhoto(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(alertMessage), nil)
    }
    
    @objc func alertMessage(image: UIImage, error: Error?, context: UnsafeRawPointer){
        if let error = error {
            print(error.localizedDescription)
        }
        showAlert = true
    }
}
