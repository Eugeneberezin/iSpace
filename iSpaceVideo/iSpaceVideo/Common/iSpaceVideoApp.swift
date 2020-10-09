//
//  iSpaceVideoApp.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import SwiftUI

@main
struct iSpaceVideoApp: App {
    @State private var selectedTap = ""
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTap) {
                ContentView()
                    
                    .onTapGesture {
                        selectedTap = "videoList"
                    }
                    .tabItem {
                        Image(systemName: "play.rectangle")
                            .foregroundColor(Color.init("tabBarImageColor"))
                        
                    }
                    .tag("videoList")
                SavedVideoList()
                    .tabItem {
                        Image(systemName: "list.dash")
                            .foregroundColor(Color.init("tabBarImageColor"))
                    }
                    .tag("savedVideos")
                
            }
            
            
        }
    }
}
