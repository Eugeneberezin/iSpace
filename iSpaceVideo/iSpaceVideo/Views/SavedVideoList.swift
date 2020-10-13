//
//  SavedVideoList.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct SavedVideoList: View {
    @State var searchTerm = ""
    @EnvironmentObject var manager: PersistenceManager
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(.vertical) {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 300, maximum: 500), spacing: 0)]) {
                        ForEach(manager.savedItems) { item in
                            if let urlString = item.links.first?.href.formatURLString() {
                                VideoItemView(manager: _manager, isButtonHidden: true, item: item, image: WebImage(url: URL(string: urlString)), title: item.data.first?.title ?? "N/A")
                            }
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Saved Videos")
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

struct SavedVideoList_Previews: PreviewProvider {
    static var previews: some View {
        SavedVideoList()
    }
}
