//
//  EditGameView.swift
//  Betho
//
//  Created by Paull Stanley on 4/17/22.
//

import SwiftUI

struct EditGameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var gameEntity: GameEntity
    @State private var newGameName: String = ""
    
    var body: some View {
        HStack {
            VStack {
                Form {
                    TextField(gameEntity.unwrappedName, text: $newGameName)
                }
                .shadow(color: .gray, radius: 5)
                Spacer()
                HStack {
                        Button("Save") {
                            saveGame()
                            presentationMode.wrappedValue.dismiss()
                        }
                        .buttonStyle(TitleButtonStyle(color: .accentColor))
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(TitleButtonStyle(color: .accentColor))
                }
                .padding()
                .background(ignoresSafeAreaEdges: .vertical)
            }
        }
       
        
        
    }
    
    func saveGame() {
        gameEntity.setValue(newGameName, forKey: "name")
        do {
            try moc.save()
        } catch {
            print("There was an issue saving the game name")
        }
        
    }
}

struct EditGameView_Previews: PreviewProvider {
    static var previews: some View {
        EditGameView(gameEntity: GameEntity(context: CoreDataManager.shared.viewContext))
    }
}
