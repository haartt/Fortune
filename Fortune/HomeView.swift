//
//  HomeView.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.15, green: 0.12, blue: 0.08),
                        Color(red: 0.25, green: 0.18, blue: 0.10),
                        Color(red: 0.35, green: 0.24, blue: 0.12)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                if viewModel.appState == .initial {
                    // Tap to reveal screen
                    TapToRevealView {
                        viewModel.startRevealAnimation()
                    }
                } else {
                    // Main fortune display
                    FortuneDisplayView(
                        geometry: geometry,
                        viewModel: viewModel
                    )
                }
                
                // Chat overlay
                if viewModel.showChat {
                    ChatView(
                        onClose: { viewModel.showChat = false }
                    )
                }
            }
        }
        .ignoresSafeArea()
    }
}
