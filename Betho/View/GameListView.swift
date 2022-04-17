//
//  GameListView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI
import CoreData

struct GameListView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \GameEntity.id, ascending: true)])
    private var games: FetchedResults<GameEntity>
    
    @State private var isPresented = false
    @State private var isEditable = false
    
    
    var body: some View {
        VStack {
            List {
                ForEach(games) { game in
                    ZStack {
                        if isEditable == false {
                            NavigationLink(destination: {
                                PhraseListView(game: game)
                            }, label: {
                                Text(game.name ?? "")
                            })
                        } else if isEditable == true {
                            NavigationLink(destination: {
                                EditGameView(gameEntity: game).onAppear(perform: { isEditable = false })
                                
                            }, label: {
                                Text(game.unwrappedName)
                                Spacer()
                                Image(systemName: "text.append")
                            })
                        }
                    }
                    
                }
                .onDelete(perform: deleteGame)
            }
            .navigationTitle("Saved Games")
            .sheet(isPresented: $isPresented) {
               CreateGameView()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action:  {
                        isEditable.toggle()
                    }, label: {
                        Label("Edit Game", systemImage: "square.and.pencil")
                    })
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Label("Add Game", systemImage: "plus")
                    })
                }
            }
        }
    }
    private func deleteGame(at offset: IndexSet) {
        for index in offset {
            let gameToDelete = games[index]
            do {
                moc.delete(gameToDelete)
                try moc.save()
            } catch {
                moc.rollback()
            }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
