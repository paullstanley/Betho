//
//  AddPhraseView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct AddPhraseView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var gameEntity: GameEntity
    @State private var phraseName = ""
    
    var body: some View {
            VStack {
                Form {
                    TextField("Enter word or phrase", text: $phraseName)
                }
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    } .buttonStyle(TitleButtonStyle(color: .accentColor))
                    Spacer()
                    Button("Save") {
                        savePhrase()
                        dismiss()
                    }
                    .buttonStyle(TitleButtonStyle(color: .accentColor))
                }
                .padding()
            }
    }
    
    private func savePhrase() {
        let newPhrase = PhraseEntity(context: moc)
        newPhrase.id = UUID()
        newPhrase.content = phraseName
        newPhrase.owning_game = gameEntity
        
        do {
            try moc.save()
        } catch {
            moc.rollback()
        }
    }
}

struct AddPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhraseView(gameEntity: GameEntity(context: CoreDataManager.shared.viewContext))
    }
}
