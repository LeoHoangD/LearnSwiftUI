//
//  TimerAnimationView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

import SwiftUI

struct TimelineAnimationView: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            Rectangle()
                .visualEffect { content, proxy in
                    content.colorEffect(ShaderLibrary.breathingGradient(
                        .float2(proxy.size),
                        .float(Float(timeline.date.timeIntervalSinceReferenceDate))
                    ))
                }
                
        }
    }
}



#Preview {
    TimelineAnimationView()
}
