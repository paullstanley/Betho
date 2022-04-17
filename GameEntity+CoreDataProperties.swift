//
//  GameEntity+CoreDataProperties.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//
//

import Foundation
import CoreData


extension GameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameEntity> {
        return NSFetchRequest<GameEntity>(entityName: "GameEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var owned_phrases: Set<PhraseEntity>?
    
    public var phrases: [PhraseEntity] {
        let setOfPhrases = owned_phrases
        return setOfPhrases!.sorted() {
            $0.id > $1.id
        }
    }

}

extension GameEntity {
    public var unwrappedName: String {
        let name = name ?? "Unknown name"
        return name
    }
}

// MARK: Generated accessors for owned_phrases
extension GameEntity {

    @objc(addOwned_phrasesObject:)
    @NSManaged public func addToOwned_phrases(_ value: PhraseEntity)

    @objc(removeOwned_phrasesObject:)
    @NSManaged public func removeFromOwned_phrases(_ value: PhraseEntity)

    @objc(addOwned_phrases:)
    @NSManaged public func addToOwned_phrases(_ values: NSSet)

    @objc(removeOwned_phrases:)
    @NSManaged public func removeFromOwned_phrases(_ values: NSSet)

}

extension GameEntity : Identifiable {

}
