//
//  ContentView.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import SwiftUI
import CoreData
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State private var searchTerm = ""
    @ObservedObject var viewModel = ContentModel()

    var body: some View {
        NavigationView{
            VStack {
                
                SearchBar(text: $searchTerm, onTextChanged: searchMovies(for:))
                
                if viewModel.items.isEmpty {
                    Text("Search for Nasa Videos")
                        .font(.system(size: 35)).bold()
                        .foregroundColor(.white)
                        
                }
               
                
                ScrollView(.vertical) {
                    if viewModel.isActivityIndicatorShowing {
                        ProgressView()
                            .padding()
                            .progressViewStyle(CircularProgressViewStyle.init(tint: Color.yellow))
                            
                    }
                
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 300, maximum: 500), spacing: 0)]) {
                        ForEach(viewModel.items) { item in
                            
                            if let urlString = item.links.first?.href.formatURLString() {
                                if urlString.hasSuffix("jpg") {
                                    VideoItemView(image:
                                                    WebImage(url: URL(string: urlString), options: .delayPlaceholder)
                                                    .placeholder {
                                                        Image("placeholder")
                                                            .resizable()
                                                            .scaledToFit()
                                                        
                                                    }, title: item.data.first?.title ?? "N/A")
                                    
                                    
                                }
                            }
                        }
                    }
                }
                .onTapGesture{
                    hideKeyboard()
                }
            }
           
            
            .navigationTitle("NASA Videos")
            .background(
                Image("nightSky")
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                        hideKeyboard()
                    }
            )
            
        }
    }
    
    func searchMovies(for searchText: String) {
        if !searchText.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                viewModel.getVideos(for: searchText)
            }
            
        } else {
            viewModel.items.removeAll()
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
