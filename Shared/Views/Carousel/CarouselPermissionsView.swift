//
//  CarouselPermissionsView.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 6/4/22.
//

import SwiftUI

struct CarouselPermissionsView: View {
    var mainImageName: String?
    var title: String?
    var description: String?
    var mainButtonText: String?
    var mainButtonAction: (() -> Void)?
    var cancelButtonAction: (() -> Void)?
    @Binding var selection: String?
    var body: some View {
        VStack(alignment: .center, spacing: 46) {
            HStack {
                Spacer()
            }
            Image(mainImageName ?? "")
            VStack(spacing: 52) {
                Text("\(title ?? "") \n\n \(description ?? "")")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(
                        EdgeInsets(top: 0, leading: 64, bottom: 0, trailing: 64)
                    )
                VStack {
                    NavigationLink(destination: PostsListView().navigationBarHidden(true), tag: "A", selection: $selection) {
                        BaseButton(buttonText: mainButtonText ?? "") {
                            guard let mainButtonAction = mainButtonAction else {
                                return
                            }
                            mainButtonAction()
                        }
                    }
                    NavigationLink(destination: PostsListView().navigationBarHidden(true), tag: "B", selection: $selection) {
                        BaseButton(buttonText: L10n.cancelButtonText, buttonType: .empty) {
                            guard let cancelButtonAction = cancelButtonAction else {
                                return
                            }
                            cancelButtonAction()
                        }
                    }
                }.padding(
                    EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
                )
            }
        }
    }
}

//struct AccessCameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselPermissionsView(mainImageName: R.Base.icCameraPermissions.name)
//    }
//}
