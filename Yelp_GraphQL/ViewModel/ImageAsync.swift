//
//  ImageAsync.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 23/01/2022.
//

import Foundation
import UIKit


struct ImageAsync{
    static let shared = ImageAsync()
    
    func loadImage(url:String) async throws -> UIImage{
        guard let url = URL(string: url) else {throw URLError(.badURL)}
        let (data,_) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeRawData)
        }
        return image
    }
}



extension URLSession {
    @available(iOS, deprecated: 15.0, message: "This extension is no longer necessary. Use API built into SDK")
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
