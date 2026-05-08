//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 7/10/25.
//

import SwiftUI
import FoundationExtension
import Presentation


struct ContentView: View {
    
    var body: some View {
        VStack {
//            AnimatedPulseView()
            TimelineAnimationView()
        }
        .onAppear {
            FoundationExtension::greeting()
            Presentation::greeting()
            
            "Dog".Presentation::sayHello()
        }
    }

}

#Preview {
    ContentView()
}
