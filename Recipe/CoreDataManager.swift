//
//  CoreDataManager.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import CoreData

class CoreDataManager {

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Recipe")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CoreDataManager {
    static let sharedManager = CoreDataManager()
    
    var managedObjectContext: NSManagedObjectContext  { return persistentContainer.viewContext}
    
    func createNewRecipe() -> Recipe{
        let recipe: Recipe = NSEntityDescription.insertNewObject(forEntityName: "Recipe", into: persistentContainer.viewContext) as! Recipe
        recipe.id = NSDate().timeIntervalSince1970;
        
        saveContext()
        
        return recipe
    }
    
    func delete(recipe: Recipe) {
        persistentContainer.viewContext.delete(recipe)
        saveContext()
    }
    
    func update(recipe: Recipe, data: Dictionary<String, AnyObject>) {
        
        recipe.setValuesForKeys(data)
        
        saveContext()
    }
    
    func deleteAll(){
        let request = NSFetchRequest<Recipe>(entityName: "Recipe")
        request.predicate = NSPredicate(value: true)
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
}

