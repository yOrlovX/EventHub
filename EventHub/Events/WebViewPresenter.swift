//
//  WebView.swift
//  EventHub
//
//  Created by Yaroslav Orlov on 09.04.2024.
//

import SwiftUI
import WebKit

struct WebViewPresenter: View {
    let url: String
    
    var body: some View {
        WebView(url: url)
    }
}

struct WebViewPresenter_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPresenter(url: "https://www.ticketmaster.com/golden-1-center-tickets-sacramento/venue/229976")
    }
}

struct WebView: UIViewRepresentable {
    let webView: WKWebView
    let url: String
    
    init(url: String) {
        webView = WKWebView(frame: .zero)
        self.url = url
    }
    
    func makeUIView(context: Context) ->  WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
    }
}
