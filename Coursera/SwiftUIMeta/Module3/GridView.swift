//
//  GridView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 31/3/26.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.3).ignoresSafeArea()
            Grid(verticalSpacing: 0) {
                GridRow {
                    RectangleTextView(color: .blue, text: "50% Off")
                }
                GridRow {
                    Rectangle()
                        .fill(.red)
                }
                GridRow {
                    Rectangle()
                        .fill(.green)
                }
            }
        
        }
    }
}

struct RectangleTextView: View {
    let color: Color
    let text: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(color)
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    GridView()
}
