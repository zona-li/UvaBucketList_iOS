//
//  AddItemViewController.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/12/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
