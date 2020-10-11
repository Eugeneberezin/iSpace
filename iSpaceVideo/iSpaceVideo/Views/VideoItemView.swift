//
//  VideoItemView.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoItemView: View {
    var image = WebImage(url: URL(string: ""))
    var title = ""
    @State var isButtonHidden = false
    @ObservedObject var viewModel = ContentModel()
    
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            HStack {
                
                Text(title.replacingOccurrences(of: "_", with: " "))
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
