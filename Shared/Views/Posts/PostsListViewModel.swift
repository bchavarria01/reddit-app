//
//  PostsListViewModel.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 8/4/22.
//

import Foundation
import Combine
import SwiftUI

class PostsListViewModel: ObservableObject {
    
    init() {
        getPosts()
    }
    
    @Published var posts = [Child] () {
        didSet {
            didChange.send(self)
        }
    }
    
    @State var searchValue: String = ""
    
    @Published var isEmpty: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var isLoading: Bool = true
    
    let didChange = PassthroughSubject<PostsListViewModel, Never>()
    
    func getPosts() {
        NetworkManager().getPosts { resposnse, errorString in
            self.posts = resposnse?.data?.children?.filter({ child in
                child.data?.linkFlairText == "Shitposting" &&
                child.data?.postHint == "image"
            }) ?? []
            self.isEmpty = self.posts.isEmpty
            self.isLoading = false
            
        } errorClosure: { error in
            print("Error: \(error.localizedDescription)")
            self.isLoading = false
        }
    }
    
    func searchPosts(with name: String) {
        isLoading = true
        if name == "" {
            self.getPosts()
        } else {
            NetworkManager().searchPosts(query: name) { response, errorString in
                if errorString != "" {
                    print("Error: \(errorString)")
                    self.isLoading = false
                } else {
                    self.posts = response?.data?.children?.filter({ child in
                        child.data?.linkFlairText == "Shitposting" &&
                        child.data?.postHint == "image"
                    }) ?? []
                    self.isEmpty = self.posts.isEmpty
                    self.isLoading = false
                }
                self.isLoading = false
            }
        }
    }
}
