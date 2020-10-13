//
//  WarningView.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/12/20.
//

import SwiftUI

struct WarningView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(12)
            Text("You have already saved this viseo")
        }
    }
}

struct WarningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView()
    }
}
