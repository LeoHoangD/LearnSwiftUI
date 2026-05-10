//
//  DragImageView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 2/4/26.
//

import SwiftUI

struct DragImageView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("Hello word")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                GridOfImagesView()
                Spacer()
            }
        }
    }
}

#Preview {
    DragImageView()
}
