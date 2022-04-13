//
//  PostsListView.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import SwiftUI
import Combine

struct PostsListView: View {
    @StateObject var cameraManager = CameraManager()
    @StateObject var locationManager = LocationManager()
    @StateObject var notificationManager = NotificationManager()
    @ObservedObject var viewModel = PostsListViewModel()
    @FocusState var focusedField: UUID?
    @State var selection: String?
    @State var isAllGranted = false
    @State var searchQuery: String = ""
    @State private var showingAlert = false
    
    init() {
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }
    
    var body: some View {
        LoadingView(isShowing: $viewModel.isLoading) {
            NavigationView {
                ZStack(alignment: .leading) {
                    Button("") {
                        
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Already set all permissions"), dismissButton: .default(Text("Ok"), action: { }))
                    }
                    .frame(width: 0, height: 1, alignment: .leading)
                    Color.white
                    VStack(spacing: 32) {
                        HStack {
                            NavigationLink(destination: PermissionsTabView(), tag: "P", selection: $selection) {
                                Button {
                                    if isAllGranted {
                                        showingAlert = true
                                    } else {
                                        showingAlert = false
                                        selection = "P"
                                    }
                                } label: {
                                    Image(R.Base.icConfig.name)
                                }.padding(.leading, 18)
                            }
                            Spacer()
                        }
                        SearchBar(text: $searchQuery, focusedField: _focusedField).background(Color.white)
                        List(viewModel.posts) { post in
                            let url = post.data?.url
                            let title = post.data?.title
                            let commentsCount = "\(post.data?.numComments ?? 0)"
                            let votesCount = "\(post.data?.score ?? 0)"
                            PostRowView(url: url, title: title, commentsCount: commentsCount, votesCoung: votesCount)
                                .listRowBackground(Color.white)
                                .listRowSeparator(.hidden)
                                .frame(maxWidth: .infinity)
                                
                        }
                        .environment(\.defaultMinListRowHeight, 420)
                        .emptyState(viewModel.isEmpty, emptyContent: {
                            VStack {
                                EmptyView()
                                Spacer()
                            }
                        })
                        .refreshable {
                            viewModel.getPosts()
                        }
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea([.leading, .trailing])
                        .listStyle(GroupedListStyle())
                        .background(Color.white)
                    }
                    .background(Color.white)
                }
            }
        }
        .onAppear(perform: {
            cameraManager.verifyCameraPermisions()
            locationManager.verifyAuth()
            notificationManager.verifyNotificationPermission()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                isAllGranted = cameraManager.permissionGranted && notificationManager.isNotificationAvailable && !locationManager.isNotDeterminated
            })
        })
        .onTapGesture {
            if (focusedField != nil) {
                focusedField = nil
            }
        }
        .onChange(of: searchQuery, perform: { newValue in
            self.viewModel.searchPosts(with: newValue)
        })
        .edgesIgnoringSafeArea(.all)
        .background(Color.white)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
