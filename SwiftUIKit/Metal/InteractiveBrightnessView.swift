//
//  InteractiveBrightnessView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

import SwiftUI

struct InteractiveBrightnessView: View {
    @State private var brightness: Float = 0.5
    var body: some View {
        VStack {
            Image("Cat1")
                .resizable()
                .frame(width: 300, height: 200)
                .colorEffect(ShaderLibrary.adjustableBrightness(.float(brightness)))
            
            Text("Brightness \(brightness)")
            Slider(value: $brightness, in: 0...1)
                .padding()
            Button("Reset") {
                brightness = 0.5
            }
        }
    }
}

#Preview {
    InteractiveBrightnessView()
}
