//
//  PickGameToPlayView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

struct PickGameToPlayView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \GameEntity.id, ascending: true)])
    private var games: FetchedResults<GameEntity>
    
    var body: some View {
            List {
                ForEach(games) { game in
                    NavigationLink(destination:BingoCardView(game: game))
                    {
                        Text(game.name ?? "")
                    }
                }
                .onDelete(perform: deleteGame)
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

struct PickGameToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        PickGameToPlayView()
    }
}
