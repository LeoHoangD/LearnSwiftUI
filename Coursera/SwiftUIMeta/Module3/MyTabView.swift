//
//  MyTabView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 1/2/26.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            Text("Home page")
                .font(.title)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Menu page")
                .font(.title)
                .tabItem({
                    Label("Menu", systemImage: "menucard")
                })
        }
    }
}

#Preview {
    MyTabView()
}
