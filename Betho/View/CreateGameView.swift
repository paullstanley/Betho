//
//  CreateGameView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct CreateGameView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @State private var gameName = ""
    var body: some View {
        HStack {
            VStack {
                    Form {
                        TextField("Game Name", text: $gameName)
                    }
                    .shadow(color: .gray, radius: 5)
                    Spacer()
                    HStack {
                        Button("Cancel") {
                            dismiss()
                        } .buttonStyle(TitleButtonStyle(color: .accentColor))
                        Spacer()
                        Button("Save") {
                            saveGame()
                            dismiss()
                        }
                        .buttonStyle(TitleButtonStyle(color: .accentColor))
                    }
                    .padding()
                    .background(ignoresSafeAreaEdges: .vertical)
            }
            
        }
        
  
    }
    
    private func saveGame() {
        let newGame = GameEntity(context: moc)
        newGame.id = UUID()
        newGame.name = gameName
        
        do {
            try moc.save()
        } catch {
            moc.rollback()
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
