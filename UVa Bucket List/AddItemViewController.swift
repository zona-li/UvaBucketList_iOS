//
//  AddItemViewController.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/12/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var longitudeLabl: UITextField!
    @IBOutlet weak var latitudeLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

   
  
}
