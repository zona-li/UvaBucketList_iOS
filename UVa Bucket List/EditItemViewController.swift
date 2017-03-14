//
//  EditItemViewController.swift
//  UVa Bucket List
//
//  Created by Zona Clark on 2/19/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var longitudeLabl: UITextField!
    @IBOutlet weak var latitudeLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    
    @IBOutlet weak var dateLabel: UIDatePicker!
    private var dateSelected: String = ""
    
    var item: BucketItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.item?.name
        dateSelected = (item?.dateToComplete)!
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        self.dateLabel.date = formatter.date(from: dateSelected)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        item?.name = nameLabel.text!
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        dateSelected = formatter.string(from: dateLabel.date)
        item?.dateToComplete = dateSelected
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
