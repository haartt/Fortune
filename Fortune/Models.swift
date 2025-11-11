//
//  Models.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import Foundation

struct Quote: Identifiable {
    let id: Int
    let date: String
    let text: String
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    var isTitle: Bool = false
}

enum AppState {
    case initial
    case revealing
    case shown
}
