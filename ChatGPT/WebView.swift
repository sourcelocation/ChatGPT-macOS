//
//  ContentView.swift
//  ChatGPT
//
//  Created by exerhythm on 11.12.2022.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    var url: URL
    func makeNSView(context: Context) -> WKWebView {
        let cssString = """
        .hidden.bg-gray-900 {
          display: none !important;
        }
        
        [class*="Thread__Wrapper"] > div:first-child{
          padding-left: 0 !important;
        }
        .text-xs.text-center {
          opacity: 0;
          height: 0;
        }
        
        .sticky,
        .pointer-events-auto.flex.border-orange-500,
        [class*="shared__Capabilities"] {
          display: none !important;
        }
        [class*="shared__Wrapper"] {
          align-items: center;
          justify-content: center;
          text-align: center;
          margin-top: 15vh;
        }
        [class*="shared__Wrapper"] h3 {
          margin-top: -40px;
          font-size: 20px;
        }
        .text-4xl {
          margin-top: 8vh;
          margin-bottom: 2rem;
        }
        .dark:bg-gray-800 {
          padding-top: 100px;
        }
        """.components(separatedBy: .newlines).joined()
        let source = """
        var style = document.createElement('style');
        style.innerHTML = '\(cssString)';
        document.head.appendChild(style);
        """
        let userScript = WKUserScript(source: source,
                                      injectionTime: .atDocumentEnd,
                                      forMainFrameOnly: true)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        return WKWebView(frame: .zero, configuration: configuration)
    }
    func updateNSView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16_1 Mobile/15E148 Safari/604.1";
        webView.load(request)
    }
}
