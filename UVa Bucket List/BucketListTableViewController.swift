//
//  BucketListTableViewController.swift
//  UVa Bucket List
//
//  Created by Haoyang Li on 2/11/17.
//  Copyright © 2017 Haoyang Li. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    // Array[0] will store uncompleted list items, Array[1] will store completed list items
    var bucketItems = [Array<BucketItem>]()
    private var completedItems = [BucketItem]()
    private var uncompletedItems = [BucketItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPrepopulatedList()
        bucketItems[0] = bucketItems[0].sorted(by: sortFunction)
        bucketItems[1] = bucketItems[1].sorted(by: sortFunction)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bucketItems[0] = bucketItems[0].sorted(by: sortFunction)
        bucketItems[1] = bucketItems[1].sorted(by: sortFunction)
        tableView.reloadData()
    }
    
    
    private func loadPrepopulatedList() {
        // Create two completed lists that will be prepopulated to user upon launch
        let prepopulatedList1 = BucketItem(name: "Apply for graduation", date: "12/01/16", isComplete: true)
        let prepopulatedList2 = BucketItem(name: "Pick up cap and gown", date: "02/05/17", isComplete: true)
        bucketItems.append(uncompletedItems)
        bucketItems.append(completedItems)
        bucketItems[1].append(prepopulatedList1)
        bucketItems[1].append(prepopulatedList2)
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
            self.bucketItems[indexPath.section].remove(at: indexPath.row)
            tappedItem.isComplete = true
            self.bucketItems[1].append(tappedItem)
            self.bucketItems[1] = self.bucketItems[1].sorted(by: self.sortFunction)
            tableView.reloadData()
        }
        done.backgroundColor = .green
        let edit = UITableViewRowAction(style: .normal, title: "Edit") {action, index in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Edit Item") as! EditItemViewController
            let selectedItem = self.bucketItems[indexPath.section][indexPath.row]
            vc.item = selectedItem
            self.present(vc, animated: true, completion: {
                tableView.deselectRow(at: indexPath, animated: true)
            })
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
    
    //
    //  Connecting cancel and done buttons to exit segue
    //
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let source = segue.source as! AddItemViewController
        let bucketItem = source.bucketItem!
        self.bucketItems[0].append(bucketItem)
        self.bucketItems[0] = self.bucketItems[0].sorted(by: self.sortFunction)
        self.tableView.reloadData()
    }
    
    private func sortFunction(s1: BucketItem, s2: BucketItem) -> Bool {
        var a1 = s1.dateToComplete.components(separatedBy: "/")
        var a2 = s2.dateToComplete.components(separatedBy: "/")
        if a1[2] < a2[2] {
            return true
        } else if a1[2] == a2[2] {
            if a1[1] < a2[1] {
                return true
            } else if a1[1] == a2[1] {
                if a1[0] < a2[0] {
                    return true
                }
            }
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

























