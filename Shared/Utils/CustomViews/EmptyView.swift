//
//  EmptyView.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 8/4/22.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image(R.Base.icEmptyState.name)
            Text(L10n.emptyStateTitle)
                .font(.system(size: 20))
            Text(L10n.emptyStateDesctiption)
                .font(.system(size: 15)).padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
