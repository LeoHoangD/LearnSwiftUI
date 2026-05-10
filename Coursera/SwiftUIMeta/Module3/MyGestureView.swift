//
//  MyGestureView.swift
//  SwiftUIMeta
//
//  Created by Huệ Huệ on 1/2/26.
//

import SwiftUI

// Some gestures to learn
// Tap
// Long Press
// Rotation
// Magnification
// Gesture Sequence

// There are other more advanced gestures that can be used and are outside the scope of this course:
//    SimultaneousGesture contains two gestures that can happen at the same time with neither of them preceding the other.
//    ExclusiveGesture is a gesture that consists of two gestures where only one of them can succeed.

struct MyGestureView: View {
    @State var message = "You can long press and then drag"
    
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded({ _ in
                    print("Long Press detected. Now you can drag me")
            })
        
        let drag = DragGesture()
            .onChanged({ _ in
                    print("Dragging...")
            })
        
        let sequence = longPress.sequenced(before: drag)
        Image("LittleLemon_Logo")
            .gesture(sequence)
    }
}

#Preview {
    MyGestureView()
}
