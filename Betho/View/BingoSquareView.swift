//
//  BingoSquareView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct BingoSquareView: View {
    @State var content: String
    @State var showOverlay = false
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 0)
            if(showOverlay == false) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).overlay(Text(content).foregroundColor(.black).minimumScaleFactor(0.1).padding(8))
                    .onTapGesture {
                        showOverlay.toggle()
                    }
            } else if(showOverlay == true) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3).overlay(Text(content).foregroundColor(.black).minimumScaleFactor(0.1).padding(8))
                shape.strokeBorder(lineWidth: 3).overlay(Text("❌").font(.largeTitle).opacity(0.5))
                    .onTapGesture {
                        showOverlay.toggle()
                    }
            }
            
            
        }

    }
}

struct BingoSquareView_Previews: PreviewProvider {
    static var previews: some View {
        BingoSquareView(content: "Test")
    }
}
