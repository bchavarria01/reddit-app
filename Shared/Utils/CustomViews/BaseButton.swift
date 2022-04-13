//
//  BaseButton.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 6/4/22.
//

import SwiftUI

enum ButtonType {
    case filled
    case empty
}

struct BaseButton: View {
    
    var buttonText: String
    var buttonType: ButtonType = .filled
    var action: (() -> Void)?
    
    let gradient = LinearGradient(
        colors: [
            Color(R.Colors.gradientColor2.color),
            Color(R.Colors.gradientColor1.color)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    var body: some View {
        Button {
            guard let closure = action else {
                return
            }
            closure()
        } label: {
            Text(buttonText)
                .foregroundColor(buttonType == .filled ? Color.white : Color.gray)
                .fontWeight(.bold)
                .padding(
                    EdgeInsets(top: 15, leading: 68, bottom: 15, trailing: 68)
                )
                .background(buttonType == .filled ? gradient : nil)
        }.cornerRadius(30, corners: .allCorners)

    }
}

struct BaseButton_Previews: PreviewProvider {
    static var previews: some View {
        BaseButton(buttonText: L10n.allowButtonText)
    }
}
