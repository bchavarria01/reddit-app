//
//  SearchBar.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import SwiftUI
import Combine
 
struct SearchBar2: View {
    @State var text: String
    var body: some View {
        SearchBar(text: $text)
    }
}
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
    @FocusState var focusedField: UUID?
    @State var someTextFieldUUID: UUID = UUID()
 
    var body: some View {
        HStack {
            TextFieldWithDebounce(debouncedText: $text)
                .focused($focusedField, equals: someTextFieldUUID)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                    }
                )
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    if (focusedField != nil) {
                        focusedField = nil
                    }
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: 0)
            }
        }
    }
}

struct SearchBar2_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar2(text: "")
    }
}

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedText = t
            } )
            .store(in: &subscriptions)
    }
}

struct TextFieldWithDebounce : View {
    @Binding var debouncedText : String
    @StateObject private var textObserver = TextFieldObserver()
    
    var body: some View {
    
        VStack {
            TextField("Search", text: $textObserver.searchText)
        }.onReceive(textObserver.$debouncedText) { (val) in
            debouncedText = val
        }
    }
}
