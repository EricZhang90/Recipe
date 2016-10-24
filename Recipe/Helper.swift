//
//  Helper.swift
//  Recipe
//
//  Created by Eric on 2016-10-24.
//  Copyright © 2016 Eric. All rights reserved.
//

import UIKit

extension UIViewController {
    func prompt(error: String!){
        let alertController = UIAlertController(title: "Oops", message: error, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: false, completion: nil)
    }
}

