//
//  VideoItemView.swift
//  iNasaVideo
//
//  Created by Eugene Berezin on 10/5/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoItemView: View {
    @EnvironmentObject var manager: PersistenceManager
    var isButtonHidden = false
    let item: Item
    var image = WebImage(url: URL(string: ""))
    var title = ""
    
    var body: some View {
        VStack {
            image
                .placeholder(
                    Image("placeholder")
                        .resizable()
                        
                )
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
                        save()
                    }) {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.purple)
                    }
                    .padding()
                    
                } else {
                    Button( action: {
                        delete()
                    }) {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                
            }
            .background(Color.black)
            .offset(x: 0, y: -24)
        }
        .padding(.bottom, -25)
        
    }
    
    func save() {
        if !manager.savedItems.contains(item){
            manager.savedItems.append(item)
        }
    }
    
    func delete() {
        if manager.savedItems.contains(item){
            manager.savedItems.removeAll(where: {$0 == item})
        }
    }
}

struct VideoItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemView( item: Item(href: "", links: [ItemLink(href: "", render: nil)], data: [Datum(nasaID: nil, myDescription: nil, dateCreated: nil, keywords: nil, title: nil, location: nil, description508: nil, photographer: nil, secondaryCreator: nil, album: nil)]))
    }
}
