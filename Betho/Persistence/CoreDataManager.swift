//
//  CoreDataManager.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "Betho")
        container.loadPersistentStores { (desctiption, error) in
            if let error = error {
                fatalError("Unable to load Core Data stack \(error)")
            }
        }
    }
    
   func  save() {
       do {
           try viewContext.save()
       } catch {
           viewContext.rollback()
       }
    }
    
}
