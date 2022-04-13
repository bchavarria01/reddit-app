//
//  EmptyStateViewModifier.swift
//  reddit-chile (iOS)
//
//  Created by Byron Chavarría on 13/4/22.
//

import SwiftUI

struct EmptyStateViewModifier<EmptyContent>: ViewModifier where EmptyContent: View {
    var isEmpty: Bool
    let emptyContent: () -> EmptyContent
    
    func body(content: Content) -> some View {
        if isEmpty {
            emptyContent()
        } else {
            content
        }
    }
}
