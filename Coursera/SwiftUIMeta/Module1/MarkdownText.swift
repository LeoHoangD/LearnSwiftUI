//
//  MarkdownText.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 11/2/26.
//

import SwiftUI

struct MarkdownText: View {
    let website = """
**My Favorite Food**
___This is italic___
Here are some styles
1. **[Figma](https://google.com.vn)** a cool thing hehe
"""
    @State private var countClick = 0
    
    @State private var showingAlert = false
    
    let rainBow = LinearGradient(colors: [
        .red, .orange, .yellow, .green, .blue
    ], startPoint: .leading, endPoint: .trailing)
    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizedStringKey(website))
            // handle xử lý sự kiện khi bấm vào url
                .environment(\.openURL, OpenURLAction { url in
                    countClick += 1
                    showingAlert = true
                    return .systemAction
                })
                .tint(.red)
                .foregroundStyle(.blue)
                .padding()
            Text("Hello **bold** and ___italic___")
            Text("You click the link \(countClick) times")
        }
        .alert("You clicked on a link", isPresented: $showingAlert) {
            Button("Ok", role: .cancel) {}
        }
        // Observe currently showingAlert value
        .onChange(of: showingAlert) { oldValue, newValue in
            print("showing alert \(showingAlert.description)")
        }
        
    }
}

#Preview {
    MarkdownText()
}
