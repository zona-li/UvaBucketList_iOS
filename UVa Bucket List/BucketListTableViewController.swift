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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPrepopulatedList()
    }
    
    
    private func loadPrepopulatedList() {
        // Create two completed lists that will be prepopulated to user upon launch
        let prepopulatedList1 = BucketItem(name: "Apply for graduation", date: "12/01/16", isComplete: true)
        let prepopulatedList2 = BucketItem(name: "Pick up cap and gown", date: "02/05/17", isComplete: true)
        bucketItems.append(completedItems)
        bucketItems.append(uncompletedItems)
        bucketItems[0].append(prepopulatedList1)
        bucketItems[0].append(prepopulatedList2)
    }
    
    

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // one section for completed list one section for uncompleted list
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketItems[section].count
    }

    
    //
    //  cellForRowAtIndexPath:
    //  Asks the data source for a cell to insert in a particular location of the
    //  table view.
    //
    private struct Storyboard {
        static let ListCellIdentifier = "List"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ListCellIdentifier, for: indexPath) as! BucketListTableViewCell
        let list = bucketItems[indexPath.section][indexPath.row]
        
        cell.bucketListNameLabel.text = list.name
        cell.bucketListDateLabel.text = list.dateToComplete
        if list.isComplete {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    
    //
    //  editActionsForRowAtIndexPath:
    //  Function to let user swipe the cell to choose edit the list or mark it done
    //
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let done = UITableViewRowAction(style: .normal, title: "Done") {action, index in
            tableView.deselectRow(at: indexPath, animated: true)
            let tappedItem: BucketItem = self.bucketItems[indexPath.section][indexPath.row]
            tappedItem.isComplete = true
            tableView.reloadData()
        }
        done.backgroundColor = .green
        let edit = UITableViewRowAction(style: .normal, title: "Edit") {action, index in
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.reloadData()

        }
        edit.backgroundColor = .orange
        return [done, edit]
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


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

  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

























