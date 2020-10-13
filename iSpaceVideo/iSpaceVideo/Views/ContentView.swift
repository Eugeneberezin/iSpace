//
//  ContentView.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    @State private var isAlertShowing = false
    @State private var isAlertShowingForVideo = false
    @StateObject var viewModel = ContentModel()
    
    var body: some View {
        NavigationView{
            VStack {
        
                SearchBarView(text: $searchTerm)
                    .padding(.bottom)
                    .background(Color.init("SearchBarBackground"))
                    .onChange(of: searchTerm, perform: { _ in
                        searchMovies(for: searchTerm)
                    })
                
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
                                    VideoItemView(item: item, image: WebImage(url: URL(string: urlString), options: .delayPlaceholder)
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
            .alert(isPresented: $isAlertShowing, content: {
                Alert(title: Text("Oops. Something went wrong"), message: Text(viewModel.errorMessage), dismissButton: .cancel())
            })
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
        viewModel.text = searchTerm
        isAlertShowing = viewModel.showAlert
        if !searchText.isEmpty {
            viewModel.isActivityIndicatorShowing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                viewModel.getVideos(for: viewModel.text)
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
