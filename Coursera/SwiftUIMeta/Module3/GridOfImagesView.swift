//
//  GridOfImagesView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 5/4/26.
//

import SwiftUI

struct GridOfImagesView: View {
    @State var images: [[ImageModel]] = [
        [
            ImageModel(name: "person", color: .red),
            ImageModel(name: "xmark", color: .green),
            ImageModel(name: "circle.fill", color: .blue),
        ],
        [
            ImageModel(name: "circle.fill", color: .red),
            ImageModel(name: "square.fill", color: .green),
            ImageModel(name: "bolt.fill", color: .blue),
        ],
        [
            ImageModel(name: "menucard.fill", color: .red),
            ImageModel(name: "square.fill", color: .green),
            ImageModel(name: "person.fill", color: .blue),
        ],
    ]
    var body: some View {
        ZStack {
//            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .opacity(0.3)
//                .ignoresSafeArea()
            VStack {
                Text("Drag Image Demo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .zIndex(100)
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
                Spacer()
                Grid {
                    ForEach(0..<images.count, id: \.self) { i in
                        GridRow {
                            ForEach(0..<images[i].count, id: \.self) { j in
                                ImageView(image: $images[i][j])
                                    .zIndex(images[i][j].zIndex)
                            }
                        }
                    }
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Shuffle")
                        .foregroundStyle(.cyan)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
//                                .fill(style: Color.black.opacity(0.7))
                                .shadow(radius: 5)
                        )
                }

            }
        }
    }
}

#Preview {
    GridOfImagesView()
}
