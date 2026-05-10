//
//  NavigationStackTitleColorView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 2/4/26.
//

import SwiftUI

struct NavigationStackTitleColorView: View {
    
    init() {
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: UIColor.red
            ]
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                ZStack {
                    Color.gray.opacity(0.3)
                        .ignoresSafeArea()
                    Text("New view")
                }
            } label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello world")
                }
            }
            .navigationTitle("My Title")

        }
    }
}

