//
//  ContentViewController.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!

    let coreDataManager = CoreDataManager.sharedManager
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "Add Content"
        
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 6.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTapped(_ sender: AnyObject) {
        
        if (textField.text?.characters.count)! > 0 {
            
            coreDataManager.update(recipe: recipe, data: ["content": textField.text! as AnyObject])
            
            let rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootView")
            
            present(rootViewController!, animated: true, completion: nil)
        }
        else {
            prompt(error: "Please enter a content")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
