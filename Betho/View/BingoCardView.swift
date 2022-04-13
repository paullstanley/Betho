//
//  BingoCardView.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI
import CoreData

struct BingoCardView: View {
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject var game: GameEntity
    var body: some View {
        let columns = [
            GridItem(.flexible(minimum: 65), spacing: 1), GridItem(.flexible(minimum: 65), spacing: 1), GridItem(.flexible(minimum: 65), spacing: 1), GridItem(.flexible(minimum: 65), spacing: 1), GridItem(.flexible(minimum: 65), spacing: 1)]
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(game.phrases) { phrase in
                    BingoSquareView(content: phrase.content ?? "")
                        .aspectRatio( 1, contentMode: .fit)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BingoCardView_Previews: PreviewProvider {
    static var previews: some View {
        BingoCardView(game: GameEntity(context: CoreDataManager.shared.viewContext))
    }
}
