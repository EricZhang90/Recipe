//
//  AddOneViewController.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let coreDataManager = CoreDataManager.sharedManager
    
    var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Name"
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 6.0
        
        recipe = coreDataManager.createNewRecipe()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backTapped(_ sender: AnyObject) {
        
        if recipe != nil {
            coreDataManager.delete(recipe: recipe)
        }
        
        let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootView")
        
        present(rootViewController!, animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        var result = false
        
        if identifier == "toContent"{
            if textField.text?.characters.count == 0{
                prompt(error: "Please Enter a name")
                result = false
            }
            else{
                coreDataManager.update(recipe: recipe, data: ["name": textField.text! as AnyObject])
                
                result = true
            }
        }
        
        return result
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContent"{
            let nextViewController = segue.destination as! ContentViewController
            nextViewController.recipe = recipe
        }
    }
}
