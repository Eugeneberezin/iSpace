//
//  SavedVideoList.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct SavedVideoList: View {
  
    
    let url = "https://images-assets.nasa.gov/video/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon~thumb.jpg".replacingOccurrences(of: " ", with: "%20")
    @State var searchTerm = ""
    @EnvironmentObject var manager: PersistenceManager
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(.vertical) {
                    ForEach(manager.savedItems) { item in
                        if let urlString = item.links.first?.href.formatURLString() {
                            VideoItemView(manager: _manager, isButtonHidden: true, item: item, image: WebImage(url: URL(string: urlString)), title: item.data.first?.title ?? "N/A")
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
