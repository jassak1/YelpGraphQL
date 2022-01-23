//
//  WebView.swift
//  Yelp_GraphQL
//
//  Created by Adam Jassak on 23/01/2022.
//

import Foundation
import SwiftUI
import WebKit

struct WebView:UIViewRepresentable{
    var url:URL
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
