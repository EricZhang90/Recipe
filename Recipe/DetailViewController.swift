//
//  DetailViewController.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recipe: Recipe!

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var content: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = recipe.name
        content.text = recipe.content
        // Do any additional setup after loading the view.
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

}
