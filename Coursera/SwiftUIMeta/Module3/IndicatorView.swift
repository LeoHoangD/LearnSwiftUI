//
//  IndicatorView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 31/3/26.
//

import SwiftUI

struct IndicatorView: View {
    let width: CGFloat
    let height: CGFloat
    let percentage: CGFloat
    let amount: CGFloat
    let bgColor: Color
    
    var barColor: LinearGradient {
        LinearGradient(colors: [.purple, .blue, .cyan, .green, .orange, .red, .purple],
                       startPoint: .leading,
                       endPoint: .trailing)
    }
    
    init(width: CGFloat, height: CGFloat, percentage: CGFloat, color: Color) {
        self.width = width
        self.height = height
        self.percentage = percentage
        self.amount = width * percentage
        self.bgColor = color
    }
    
    
    init(width: CGFloat, height: CGFloat, amount: CGFloat, color: Color) {
        self.width = width
        self.height = height
        self.percentage = amount / width
        self.amount = amount
        self.bgColor = color
    }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(bgColor)
                .frame(width: width, height: height)
            Capsule()
                .fill(barColor)
                .frame(width: width * percentage, height: height)
        }
    }
}
