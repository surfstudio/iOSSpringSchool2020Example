//
//  PhotoEntity+CoreDataProperties.swift
//  iOSTest
//
//  Created by Mikhail Monakov on 27.04.2020.
//  Copyright © 2020 Surf. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoEntity> {
        return NSFetchRequest<PhotoEntity>(entityName: "PhotoEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var desc: String?
    @NSManaged public var url: String?

}
