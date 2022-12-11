//
//  ChatGPTApp.swift
//  ChatGPT
//
//  Created by exerhythm on 11.12.2022.
//

import SwiftUI
import SwiftUI

@main
struct ChatGPTApp: App {
    var body: some Scene {
        MenuBarExtra {
            ZStack(alignment:.topTrailing) {
                WebView(url: URL(string: "https://chat.openai.com/")!)
                    .frame(width: 400, height: 500)
                Menu {
                    Button("Quit") {
                        exit(0)
                    }
                } label: {
                    Image(systemName: "gearshape")
                }
                .menuStyle(.borderlessButton)
                .menuIndicator(.hidden)
                .fixedSize()
                .padding()

                
            }
        } label: {
            Label("ChatGPT", image: "chatgpt")
        }
        .menuBarExtraStyle(.window)
    }
}
