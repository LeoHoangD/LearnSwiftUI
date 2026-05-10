//
//  MyScrollView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 1/2/26.
//

import SwiftUI
// ScrollViewReader A view that provides programmatic scrolling, by working with a proxy to scroll to known child views.

struct MyScrollView: View {
    
    @Namespace var topID
    @Namespace var bottomID
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to bottom") {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }
                .id(topID)
                
                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        color(fraction: Double(i) / 100)
                            .frame(height: 32)
                    }
                }
                
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(topID)
                    }
                }
                .id(bottomID)
            }
        }
        
        
    }
    
    func color(fraction: Double) -> Color {
        return Color(red: fraction, green: 1 - fraction, blue: 0.5)
    }
}

#Preview {
    MyScrollView()
}
