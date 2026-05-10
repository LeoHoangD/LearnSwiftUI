//
//  AttributedStringDemo.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 18/3/26.
//

import SwiftUI

struct AttributedStringDemo: View {
    var attr1Demo: AttributedString {
        var myString = AttributedString("Attributed string")
        myString.foregroundColor = .orange
        myString.backgroundColor = .black
        myString.font = Font.largeTitle
        myString.kern = 10 // khoảng cách giữa các chữ cái
        return myString
    }
    
    
    var attr2Demo: AttributedString {
        let coding = "Coding is awesome! Let's code together"
        var myString = AttributedString()
        
        myString.font = Font.title
        
        for (i, ch) in coding.enumerated() {
            var letterString = AttributedString(String(ch))
            let red = 0.3
            let green = 0.3
            let blue = Double(6*i % coding.count) / Double(coding.count)
            
            letterString.foregroundColor = Color(red: red, green: green, blue: blue)
            letterString.baselineOffset = Double(i)
            myString += letterString
        }
        
        return myString
    }
    
    
    var attr3Demo: AttributedString {
        let coding = "Coding is awesome! Let's code together"
        var myString = AttributedString()
        
        myString.font = Font.title
        
        for (i, ch) in coding.enumerated() {
            var letterString = AttributedString(String(ch))
            let count = CGFloat(coding.count)
            let j = CGFloat(coding.count / 2 - i)
            letterString.baselineOffset = smileFactor*j*j / count
//            letterString.kern = 1
            myString += letterString
        }
        
        return myString
    }
    
    
    var attr4Demo: AttributedString {
        let coding = "Coding is awesome! Let's code together"
        var myString = AttributedString()
        
        let listOfWords = coding.split(separator: " ")
        
        for (i, word) in listOfWords.enumerated() {
            var wordString = AttributedString("\(word) ")
            wordString.baselineOffset = 10 * CGFloat(i % 2)
//            wordString.kern = -3
            myString += wordString
        }
        
        return myString
    }
    
    
    var attr5Demo: AttributedString {
        var myString = AttributedString("Underline Demo")
        myString.font = .title
        myString.underlineStyle = Text.LineStyle(pattern: .dot, color: .red)
        
        return myString
    }
    
    func stepRaibowText(_ text: String = "Coding is awesome! Let's code together", stepSize: CGFloat) -> AttributedString {
        var myString = AttributedString()
        
        let listOfWords = text.split(separator: " ")
        
        for (i, word) in listOfWords.enumerated() {
            var wordString = AttributedString("\(word) ")
            wordString.baselineOffset = stepSize * CGFloat(i % 2)

            myString += wordString
        }
        
        return myString
    }
    
    @State private var smileFactor = 5.0
    @State private var flip = 0.0
    @State private var stepSize = 0.0
    
    let rainBow = LinearGradient(colors: [
        .red, .orange, .yellow, .green, .blue, .purple, .pink
    ], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ScrollView {
            Text(attr1Demo)
            Text(attr2Demo)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.3).clipShape(.rect(cornerRadius: 20)))
            Text(attr3Demo)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(rainBow)
                .rotation3DEffect(Angle(degrees: flip*180),
                              axis: (x: 1.0, y: 0.0, z: 0.0))
                .background(Color.gray.opacity(0.3))
            HStack {
                Button("🙂") {
                    withAnimation {
                        smileFactor = abs(smileFactor)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button("🐧") {
                    withAnimation {
                        flip = 1 - flip
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button("☹️") {
                    withAnimation {
                        smileFactor = -abs(smileFactor)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .font(.largeTitle)
            
            Text(attr4Demo)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(rainBow)
                .background(Color.gray.opacity(0.3))
            
            Text(stepRaibowText(stepSize: stepSize))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(rainBow)
                .background(Color.gray.opacity(0.3))
            
            Slider(value: $stepSize, in: -30...30)
            Text(attr5Demo)
        }
        .padding()
    }
}

#Preview {
    AttributedStringDemo()
}
