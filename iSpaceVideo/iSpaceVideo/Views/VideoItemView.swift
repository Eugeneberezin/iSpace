//
//  VideoItemView.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoItemView: View {
    var image = WebImage(url: URL(string: "https://images-assets.nasa.gov/video/JPL-20190606-TECHf-0001-Mars%20Chopper%20Ready%20for%20a%20Spin%20on%20Mars/JPL-20190606-TECHf-0001-Mars%20Chopper%20Ready%20for%20a%20Spin%20on%20Mars~thumb.jpg"))
    @State var isButtonHidden = false
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            HStack {
                
                Text("Go Forward to the Moon")
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                    .font(.body)
                    .foregroundColor(.white)
                    .lineLimit(2)
                Spacer()
                
                if !isButtonHidden {
                    Button( action: {
                        
                    }) {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.purple)
                    }
                    .padding()
                    
                } else {
                    Button( action: {
                        
                    }) {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.red)
                            .padding()
                            
                    }
                }
                
            }
            
            .background(Color.init("titleBackGround"))
            .offset(x: 0, y: -24)
        }
        .padding(.bottom, -25)
        
    }
    
    
}

struct VideoItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemView()
    }
}
