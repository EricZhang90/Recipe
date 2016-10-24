//
//  DetailTableViewController.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit
import CoreData

class DetailTableViewController: UITableViewController {
    
    let coreDataManager = CoreDataManager.sharedManager
    var fetchedResultsController: NSFetchedResultsController<Recipe>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeFetchedResultsController()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func backTapped(_ sender: AnyObject) {
        let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootView")
        
        present(rootViewController!, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Core Data
    func initializeFetchedResultsController() {
        let request = NSFetchRequest<Recipe>(entityName: "Recipe")
        
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let moc = coreDataManager.managedObjectContext
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)

        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        
        let sectionInfo = sections[section]
        
        return sectionInfo.numberOfObjects
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! TableViewCell
        
        let recipe: Recipe = fetchedResultsController.object(at: indexPath) 
        
        cell.setInternalField(text: recipe.name!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.recipe = fetchedResultsController.object(at: indexPath)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            tableView.beginUpdates()

            let recipe: Recipe = fetchedResultsController.object(at: indexPath)
            coreDataManager.delete(recipe: recipe)
            
            initializeFetchedResultsController()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
            
            self.tableView.rectForRow(at: indexPath)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
