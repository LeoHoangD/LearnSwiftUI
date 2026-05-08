//
//  BasicColorView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

import SwiftUI

struct BasicColorView: View {
    
    @State private var color: Shader = ShaderLibrary.solidRed()
    
    var body: some View {
        VStack {
            Rectangle()
                .colorEffect(color)
            HStack {
                Button("Red") {
                    color = ShaderLibrary.solidRed()
                }
                Button("Green") {
                    color = ShaderLibrary.solidGreen()
                }
                Button("Blue") {
                    color = ShaderLibrary.solidBlue()
                }
            }
        }
    }
    
}

#Preview {
    BasicColorView()
}
