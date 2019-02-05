//
//  InvestmentsViewController.swift
//  InvesTAPP
//
//  Created by User on 12/2/17.
//  Copyright © 2017 Zerocool. All rights reserved.
//

import UIKit



class InvestmentsViewController: UITableViewController {
    
    var investmentStore: InvestmentStore!
    
   
    @IBAction func addNewInvestment(_ sender: UIBarButtonItem) {
  
        // Create a new Item and add it to the store
        let newInvestment = investmentStore.createInvestment()
        
        // Figure out where that item is in the array
        if let index = investmentStore.allInvestments.index(of: newInvestment) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table.
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    /*
    @IBAction func toggleEditingMode(_ sender: UIButton) {

        // If you are currently in editing mode...
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }
 
 */
    
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        investmentStore.moveInvestment(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the height of the status bar
        //let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        //let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        //tableView.contentInset = insets
        //tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showInvestment" segue
        switch segue.identifier {
        case "showInvestment"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                _ = investmentStore.allInvestments[row]
                
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let investment = investmentStore.allInvestments[indexPath.row]
            
            
            let title = "Delete \(investment.name)?"
            let message = "Are you sure you want to delete this investment?"
            
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the investment from the store
                                                self.investmentStore.removeInvestment(investment)
                                                
                                                // Also remove that row from the table view with an animation
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investmentStore.allInvestments.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentCell",
                                                 for: indexPath) as! InvestmentCell
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let investment = investmentStore.allInvestments[indexPath.row]
        
        cell.nameLabel.text = investment.name
        cell.serialNumberLabel.text = investment.serialNumber
        cell.valueLabel.text = "$\(investment.valueInDollars)"
        
        return cell
    }
    
    
}
