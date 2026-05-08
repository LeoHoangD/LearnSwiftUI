//
//  AnimatedPulseView.swift
//  SwiftUIKit
//
//  Created by Huệ Huệ on 11/10/25.
//

import SwiftUI

struct AnimatedPulseView: View {
    var body: some View {
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate
            return Rectangle()
                .fill(Color.blue)
                .colorEffect(ShaderLibrary.pulsingColor(.float(time)))
        }
    }
}

#Preview {
    AnimatedPulseView()
}
