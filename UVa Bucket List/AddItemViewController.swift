//
//  AddItemViewController.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/12/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    var bucketItem: BucketItem?
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var longitudeLabl: UITextField!
    @IBOutlet weak var latitudeLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    private var dateSelected: String = ""
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        dateSelected = formatter.string(from: datePicker.date)

    }
    
    
    @IBAction func pickerValueChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        dateSelected = formatter.string(from: datePicker.date)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //
    //  hide the keyboard when the background is touched
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //
    //  Create a new bucket list item and add it to the table view
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != saveButton {
            return
        }
        if let listName = nameLabel.text {
            self.bucketItem = BucketItem(name: listName, date: dateSelected, isComplete: false)
        }
    }
    
    
    
    
    
    
}
