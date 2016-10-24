//
//  Recipe+CoreDataProperties.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe");
    }

    @NSManaged public var name: String?
    @NSManaged public var content: String?
    @NSManaged public var id: Double

}
