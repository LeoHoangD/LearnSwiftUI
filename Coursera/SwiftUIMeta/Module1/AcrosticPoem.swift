//
//  AcrosticPoem.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 11/2/26.
//

import SwiftUI

struct LineOfPoetry: Identifiable {
    let id = UUID()
    let line: String
    
    var firstChar: String {
        if let first = line.first { String(first) } else { "" }
    }
    
    var remainingLine: String {
        String(line.dropFirst())
    }
}

struct AcrosticPoem: View {
    let lines: [LineOfPoetry] = [
        LineOfPoetry(line: "Dancing in the moonlight, free,"),
        LineOfPoetry(line: "Reaching for the stars, we see."),
        LineOfPoetry(line: "Every wish, a whispered stream,"),
        LineOfPoetry(line: "Aiming high, in every scheme."),
        LineOfPoetry(line: "Moments woven with desire,"),
        LineOfPoetry(line: "Soaring dreams, higher and higher."),
    ]
    var body: some View {
        VStack {
            let dr = Text("D")
                .foregroundStyle(.red)
                .bold()
                .font(.largeTitle)
            let cool = Text("Very cool")
                .foregroundStyle(.green)
                .font(.title)
            Text("\(dr)eams. \(cool)")
            
            ForEach(lines) { line in
                styleText(line: line, firstColor: .red, lineColor: .black)
            }
        }
    }
    
    func styleText(line: LineOfPoetry, firstColor: Color, lineColor: Color) -> Text {
        let t1 = Text("\(line.firstChar)")
            .foregroundStyle(firstColor)
            .bold()
            .font(.largeTitle)
        let t2 = Text("\(line.remainingLine)")
            .foregroundStyle(lineColor)
            .font(.title)
        return Text("\(t1) \(t2)")
    }
}

#Preview {
    AcrosticPoem()
}
