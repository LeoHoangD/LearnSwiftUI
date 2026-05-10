//
//  BlurEffectText.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 27/3/26.
//

import SwiftUI

enum RendererType: String, CaseIterable {
    case blur
    case wobble
}

struct BlurEffectText: View {
    @State private var blur = 1.0
    @State private var rendererType: RendererType = .blur
    
    let heart = Image(systemName: "heart.fill")
    
    var helloWorld: Text {
        Text("Hello \(heart) World")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.red)
            .customAttribute(CustomAttr())
    }
    var body: some View {
        VStack {
            Picker("Render Type", selection: $rendererType) {
                ForEach(RendererType.allCases, id: \.self) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Another \"\(helloWorld)\" in your area")
                .font(.title)
                .multilineTextAlignment(.center)
                .textRenderer(Renderer(value: blur, renderType: rendererType))
            
            Spacer()
             
            Slider(value: $blur, in: 0...10)
        }
    }
}

struct Renderer: TextRenderer {
    let value: CGFloat
    let renderType: RendererType
    
    func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
        let allLines = layout.flatMap({ $0 })
        
        for line in allLines {
            if line[CustomAttr.self] != nil {
                var localContext = ctx
                
                switch renderType {
                case .blur:
                    let blurFilter = GraphicsContext.Filter.blur(radius: value)
                    localContext.addFilter(blurFilter)
                case .wobble:
                    let wobbleFilter = GraphicsContext.Filter.distortionShader(ShaderLibrary.wobble(.float(value)), maxSampleOffset: .zero)
                    localContext.addFilter(wobbleFilter)
                }
                
                localContext.draw(line)
            } else {
                let localContext = ctx
                localContext.draw(line)
            }
        }
    }
}

// Tạo 1 custom attr để gắn vào thuộc tính của text. Sau đó dùng để làm định danh truy xuất
struct CustomAttr: TextAttribute {
    
}

#Preview {
    BlurEffectText()
}
