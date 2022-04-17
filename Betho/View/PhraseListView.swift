//
//  PhraseListView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct PhraseListView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \PhraseEntity.id, ascending: true)])
    private var phrases: FetchedResults<PhraseEntity>
    
    @ObservedObject var game: GameEntity
    
    @State private var isPresented = false
    @State private var isEditable = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(game.phrases) { phrase in
                    ZStack {
                        if isEditable == false {
                            Text(phrase.content ?? "").onAppear(perform: {
                                isEditable = false
                            })
                        } else if isEditable == true {
                            HStack {
                                NavigationLink(destination: {
                                    EditPhraseView(phraseEntity: phrase).onAppear(perform: {
                                        isEditable = false
                                    })
                                }, label: {
                                    Text(phrase.content ?? "")
                                    Spacer()
                                    Image(systemName: "text.append")
                                })
                                
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deletePhrase)
            }
        }
        .navigationTitle(game.name ?? "")
        .sheet(isPresented: $isPresented) {
            AddPhraseView(gameEntity: game)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    isEditable.toggle()
                }, label: {
                    Label("Edit Phrase", systemImage: "square.and.pencil")
                })
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Label("Add Game", systemImage: "plus")
                })
            }
        }
    }
    
    private func deletePhrase(at offset: IndexSet) {
        for index in offset {
            let phraseToDelete = phrases[index]
            do {
                moc.delete(phraseToDelete)
                try moc.save()
            } catch {
                moc.rollback()
            }
        }
    }
}

struct PhraseListView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseListView(game: GameEntity(context: CoreDataManager.shared.viewContext))
    }
}
