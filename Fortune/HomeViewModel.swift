//
//  HomeViewModel.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var quotes: [Quote] = [
        Quote(id: 1, date: "6 November", text: "Beneath the weight of silence, your clarity will forge paths where others see only shadows."),
        Quote(id: 2, date: "5 November", text: "Even the heaviest clouds must part to reveal the sun, trust your journey."),
        Quote(id: 3, date: "4 November", text: "The strongest trees grow in the winds of adversity."),
        Quote(id: 4, date: "3 November", text: "Every sunset is an opportunity to reset."),
        Quote(id: 5, date: "2 November", text: "Your potential is endless, go do what you were created to do.")
    ]
    
    @Published var currentIndex = 0
    @Published var appState: AppState = .initial
    
    @Published var glowScale: CGFloat = 0
    @Published var glowOpacity: Double = 0
    @Published var cardRotation: Double = 180
    @Published var cardOpacity: Double = 0
    
    @Published var showChat = false
    @Published var chatMessages: [ChatMessage] = []
    @Published var currentMessage = ""
    
    var currentQuote: Quote {
        quotes[currentIndex]
    }
    
    func startRevealAnimation() {
        appState = .revealing
        
        withAnimation(.easeOut(duration: 1.0)) {
            glowScale = 1.2
            glowOpacity = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.8)) {
                self.cardRotation = 0
                self.cardOpacity = 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeOut(duration: 0.6)) {
                self.glowOpacity = 0
                self.appState = .shown
            }
        }
    }
    
    func openChat(for quote: Quote) {
        chatMessages = [
            ChatMessage(text: quote.text, isUser: false, isTitle: true),
            ChatMessage(text: "Embrace those quiet moments today. They can lead to fresh ideas or solutions that others might overlook. Trust your intuition and be open to insights that come from reflection, they can guide you in making decisions or navigating challenges effectively.", isUser: false)
        ]
        showChat = true
    }
    
    func sendMessage() {
        guard !currentMessage.isEmpty else { return }
        
        chatMessages.append(ChatMessage(text: currentMessage, isUser: true))
        currentMessage = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.chatMessages.append(ChatMessage(text: "In quiet moments, you will find understanding and insight that others might miss. This awareness will help you create opportunities and solutions in situations where people are confused or uncertain.", isUser: false))
        }
    }
}
