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
    
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(.vertical) {
                    ForEach(0...20, id: \.self) { num in
                        VideoItemView(image:
                                        WebImage(url: URL(string: url), options: .delayPlaceholder)
                                        .placeholder {
                                            Image("placeholder")
                                                .resizable()
                                                .scaledToFit()
                                        },
                        isButtonHidden: true
                        )
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
