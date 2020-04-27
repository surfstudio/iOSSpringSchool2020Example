//
//  CoreDataStack.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 27.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//

import CoreData

final class CoreDataStack {

    static let shared = CoreDataStack()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (description, error) in
            print(description)
            if let error = error {
                fatalError("Unable to load persistent store: \(error)")
            }
        })
        return container
    }()

    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

}
