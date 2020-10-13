//
//  SearchBar.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//



import SwiftUI

/*
 When I started working on the project I decided to create UIViewRepresentable but later on I thought it would be a better user experience to create a search bar in SwiftUI. SearchBar as UIViewRepresentable has two UI bugs delete text button and cancel button are not working on tap gesture and only work on long press gesture which is not what a user expects. I am not sure if it has something to do with a simulator but to provide more smooth experience I replaced it with a native SwiftUI search bar that I built for this project.
 */

struct SearchBar : UIViewRepresentable {
    
    @Binding var text : String
    var onTextChanged: (String) -> Void
    
    class Coordinator : NSObject, UISearchBarDelegate {
        @Binding var text: String
        var onTextChanged: (String) -> Void
        
        init(text: Binding<String>, onTextChanged: @escaping (String) -> Void) {
            _text = text
            self.onTextChanged = onTextChanged
        }
        
        // Show cancel button when the user begins editing the search text
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            onTextChanged(text)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
            // Send back empty string text to search view, trigger self.model.searchResults.removeAll()
            onTextChanged(text)
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, onTextChanged: onTextChanged)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search for Nasa Videos"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}



struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
