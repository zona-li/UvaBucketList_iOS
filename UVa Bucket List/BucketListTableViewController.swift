//
//  BucketListTableViewController.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/11/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    // Array[1] will store uncompleted list items, Array[0] will store completed list items
    var bucketItems = [Array<BucketItem>]()
    private var completedItems = [BucketItem]()
    private var uncompletedItems = [BucketItem]()
    
    
    private func loadPrepopulatedList() {
        // Create two completed lists that will be prepopulated to user upon launch
        let prepopulatedList1 = BucketItem(name: "Apply for graduation", date: "12/01/16", isComplete: true)
        let prepopulatedList2 = BucketItem(name: "Pick up cap and gown", date: "02/05/17", isComplete: true)
        bucketItems.append(completedItems)
        bucketItems.append(uncompletedItems)
        bucketItems[0].append(prepopulatedList1)
        bucketItems[0].append(prepopulatedList2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPrepopulatedList()
    }

    

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // one section for completed list one section for uncompleted list
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketItems[section].count
    }

    private struct Storyboard {
        static let ListCellIdentifier = "List"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ListCellIdentifier, for: indexPath) as! BucketListTableViewCell
        let list = bucketItems[indexPath.section][indexPath.row]
        
        cell.bucketListNameLabel.text = list.name
        cell.bucketListDateLabel.text = list.dateToComplete
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
