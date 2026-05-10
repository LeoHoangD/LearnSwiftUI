//
//  PluralizationView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 3/3/26.
//

import SwiftUI

struct PluralizationView: View {
    @State private var count = 0
    let nounList = [
        "bread", "salt", "domino", "radius", "child", "foot", "tooth"
    ]
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    ForEach(nounList, id: \.self) { noun in
                        LabeledContent(noun.capitalized) {
                            Text("^[\(count) \(noun.capitalized)](inflect: true)")
                        }
                    }
                }
                Button("Increment", systemImage: "plus.circle.fill", action: {
                    count += 1
                })
            }
            .font(.title)
            .toolbar {
                ToolbarItem {
                    Button("Reset") { count = 0 }
                }
            }
            .navigationTitle("Pluralization")
        }
    }
}

#Preview {
    PluralizationView()
}
