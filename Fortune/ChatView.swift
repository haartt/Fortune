//
//  ChatView.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI

struct ChatView: View {
    let explanationMessage: String?
    let onClose: () -> Void
    
    init(explanationMessage: String? = nil, onClose: @escaping () -> Void) {
        self.explanationMessage = explanationMessage
        self.onClose = onClose
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }
            
            VStack(spacing: 0) {
                Spacer()
                
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 14) {
                            if let explanation = explanationMessage {
                                Text(explanation)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 6)
                            }
                        }
                        .padding(20)
                    }
                    .frame(maxHeight: 360)
                }
                .background(Color(white: 0.12))
                .cornerRadius(26)
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
    }
}
