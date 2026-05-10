//
//  ContentView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 15/1/26.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "" {
        didSet {
            print("Text is now \(name)")
        }
    }
    
    @State var isShowLogo = true
    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.yellow)
//            Text("Hello world")
//                .frame(width: 200, height: 50)
//                .background(Color.red)
////                .padding(.bottom, 30)
//            HStack {
//                Button("One") {}
//                Button("Two") {}
//                Button("Three") {}
//            }
//            .background(Color.green)
//            
//        }
////        .frame(width: 300, alignment: .leading)
//        .background(Color.gray)
//        LittleLemonRestaurant(showLogo: $isShowLogo)
//        NavigationView {
//            VStack {
//                Text("Select your preferred menu:")
//                    .font(.title)
//                NavigationLink(destination: Color.green) {
//                    Text("Bistro menu")
//                        .font(.title)
//                        .foregroundStyle(Color.green)
//                }
//                
//                NavigationLink(destination: Color.yellow) {
//                    Text("Take away menu")
//                        .font(.title)
//                        .foregroundStyle(Color.yellow)
//                }
//            }
//            .navigationTitle("Little Lemon menus")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        GooeyView()
//        MyGestureView()
//        LittleLemonRestaurant()
//        BlurEffectText()
//        NavigationStackTitleColorView()
        DragImageView()
    }
        
}

#Preview {
    ContentView()
}
