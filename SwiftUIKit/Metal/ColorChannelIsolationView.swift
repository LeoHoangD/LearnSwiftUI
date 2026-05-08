//
//  ColorChannelIsolationView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

import SwiftUI

struct ColorChannelIsolationView: View {
    @State private var filter: Shader = ShaderLibrary.redChannelFilter()
    var body: some View {
        VStack {
            Image("Cat1")
                .resizable()
                .frame(width: 300, height: 200)
                .colorEffect(filter)
            HStack {
                Button("Red") {
                    filter = ShaderLibrary.redChannelFilter()
                }
                Button("Green") {
                    filter = ShaderLibrary.greenChannelFilter()
                }
                Button("Blue") {
                    filter = ShaderLibrary.blueChannelFilter()
                }
            }
        }
    }
}

#Preview {
    ColorChannelIsolationView()
}
