//
//  TapToReveal.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI

struct TapToRevealView: View {
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text("Tap to reveal your fortune")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.white.opacity(0.8))
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap()
        }
    }
}
