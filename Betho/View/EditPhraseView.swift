//
//  EditPhraseView.swift
//  Betho
//
//  Created by Paull Stanley on 4/17/22.
//

import SwiftUI

struct EditPhraseView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var phraseEntity: PhraseEntity
    @State private var newPhraseName: String = ""
    
    var body: some View {
        HStack {
            VStack {
                Form {
                    TextField(phraseEntity.content ?? "Unknwon Phrase", text: $newPhraseName)
                }
                .shadow(color: .gray, radius: 5)
                Spacer()
                HStack {
                    Button("Save") {
                        savePhrase()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(TitleButtonStyle(color: .accentColor))
                    Spacer()
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
    
    func savePhrase() {
        phraseEntity.setValue(newPhraseName, forKey: "content")
        do {
            try moc.save()
            moc.refreshAllObjects()
        } catch {
            print("There was an error saving the phrase")
        }
    }
    
}

struct EditPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhraseView(phraseEntity: PhraseEntity(context: CoreDataManager.shared.viewContext))
    }
}
