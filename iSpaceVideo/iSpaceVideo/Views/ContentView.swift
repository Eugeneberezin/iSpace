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
  
    
    let url = "https://images-assets.nasa.gov/video/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon~thumb.jpg".replacingOccurrences(of: " ", with: "%20")
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $searchTerm)
                   
                ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 300, maximum: 500), spacing: 0)]) {
                        ForEach(0...30, id: \.self) { num in
                            VideoItemView(image:
                                            WebImage(url: URL(string: url), options: .delayPlaceholder)
                                            
                                            .placeholder {
                                                Image("placeholder")
                                                    .resizable()
                                                    .scaledToFit()
                                                
                                            }
                                          
                            )
                            
                            
                        }

                        
                    }
                .onAppear {
                    NetworkManager.shared.getVideos() { result in
                        
                        switch result {
                        case .success(let videos):
                            debugPrint(videos)
                        case .failure(let error):
                            debugPrint(error.localizedDescription)
                        }
                        
                    }
                }
                    
                }
 
                
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    hideKeyboard()
                })
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
