//
//  QuoteCardView.swift
//  Fortune
//
//  Created by Fabio Antonucci on 11/11/25.
//

import SwiftUI

struct QuoteCardView: View {
    let quote: Quote
    let onSparklesTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(white: 0.15))
                .frame(maxWidth: 280)
                .frame(height: 280)
                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 8)
                .overlay(
                    VStack(alignment: .leading, spacing: 8) {
                        Text(quote.date)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white.opacity(0.6))
                        
                        Text(quote.text)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.white)
                            .lineSpacing(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                        
                        Spacer()
                        
                        Button(action: onSparklesTap) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(0.15))
                                .clipShape(Circle())
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                )
        }
        .padding(.horizontal, 28)
    }
}


