//
//  FortuneDisplayView.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI

struct FortuneDisplayView: View {
    let geometry: GeometryProxy
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: geometry.size.height * 0.08)

                VStack(spacing: 12) {
                    Image(systemName: "apple.meditate")
                        .font(.system(size: 30, weight: .regular))
                        .foregroundColor(.white)
                        .opacity(viewModel.appState == .shown ? 1 : 0)
                    
                    Text("Good morning.")
                        .font(.system(size: 26, weight: .regular))
                        .foregroundColor(.white)
                        .opacity(viewModel.appState == .shown ? 1 : 0)
                }
                .padding(.bottom, 32)

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [
                                    Color.orange.opacity(0.8),
                                    Color.orange.opacity(0.4),
                                    Color.orange.opacity(0.1),
                                    Color.clear
                                ]),
                                center: .center,
                                startRadius: 0,
                                endRadius: 250
                            )
                        )
                        .frame(width: 500, height: 500)
                        .scaleEffect(viewModel.glowScale)
                        .opacity(viewModel.glowOpacity)
                    
                    QuoteCardView(
                        quote: viewModel.currentQuote,
                        onSparklesTap: {
                            viewModel.openChat(for: viewModel.currentQuote)
                        }
                    )
                    .rotation3DEffect(
                        .degrees(viewModel.cardRotation),
                        axis: (x: 1, y: 0, z: 0),
                        perspective: 0.5
                    )
                    .opacity(viewModel.cardOpacity)
                }
                .frame(
                    width: geometry.size.width * 0.65,
                    height: geometry.size.width * 0.65
                )
                .padding(.horizontal, geometry.size.width * 0.1)
                .padding(.vertical, geometry.size.height * 0.02)

                Spacer()

                HStack {
                    Button(action: {}) {
                        Image(systemName: "clock")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
                .opacity(viewModel.appState == .shown ? 1 : 0)
            }
            
            if viewModel.showChat {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .animation(.easeInOut, value: viewModel.showChat)
                
                ChatView(onClose: { viewModel.showChat = false })
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: viewModel.showChat)
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
