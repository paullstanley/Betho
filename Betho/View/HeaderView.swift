//
//  HeaderView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
            HStack {
                    Text("Bingo")
                        .font(.system(size: 35))
                        .fontWeight(Font.Weight.thin)
                       // .shadow(color: Color.black.opacity(0.5), radius: 10, x: 10, y: 10)
                }
                .frame(width: 600.0)
                .foregroundColor(.white)
                .background(Color.accentColor)
           // .shadow(color: Color.black.opacity(0.5), radius: 20, x: 20, y: 20)

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
