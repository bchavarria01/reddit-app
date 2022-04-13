//
//  PostRowView.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import SwiftUI
import Nuke
import NukeUI

struct PostRowView: View {
    var url: String?
    var title: String?
    var commentsCount: String?
    var votesCoung: String?
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    LazyImage(
                        source: url ?? "") { state in
                        if let image = state.image {
                            image.frame(height: 210).aspectRatio(10, contentMode: .fit)
                        } else if state.error != nil {
                            Image(R.Base.icPlaceholder.name)
                        }
                    }
                    Spacer()
                }
                VStack {
                    HStack {
                        VStack {
                            Image(R.Base.icUpArrow.name)
                            Text(votesCoung ?? "32")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                            Image(R.Base.icDownArrow.name)
                        }.padding(.trailing, 20)
                        VStack(alignment: .leading) {
                            Text(title ?? "Hello world ")
                                .font(.system(size: 20))
                                .multilineTextAlignment(.leading)
                                .frame(height: 80)
                            HStack {
                                Image(R.Base.icComments.name)
                                Text(commentsCount ?? "43")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        Spacer()
                    }.padding()
                    Spacer()
                }
            }
        }
        .frame(height: 380)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 3, x: 0, y: 5)
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(url: "https://preview.redd.it/y4jjll7fj6s81.jpg?width=960&crop=smart&auto=webp&s=1bbfca7e2c52610864c142ef837e908f86d2e472")
    }
}
