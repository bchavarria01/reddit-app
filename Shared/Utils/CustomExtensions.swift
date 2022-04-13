//
//  CustomExtensions.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 6/4/22.
//

import SwiftUI

enum Side: Equatable, Hashable {
    case left
    case right
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func padding(sides: [Side], value: CGFloat = 8) -> some View {
        HStack(spacing: 0) {
            if sides.contains(.left) {
                Spacer().frame(width: value)
            }
            self
            if sides.contains(.right) {
                Spacer().frame(width: value)
            }
        }
    }
    
    func emptyState<EmptyContent>(_ isEmpty: Bool,
                                  emptyContent: @escaping () -> EmptyContent) -> some View where EmptyContent: View {
        modifier(EmptyStateViewModifier(isEmpty: isEmpty, emptyContent: emptyContent))
    }
}
