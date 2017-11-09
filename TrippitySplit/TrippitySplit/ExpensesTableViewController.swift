//
//  ExpensesTableViewController.swift
//  TrippitySplit
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 graciefulgirl. All rights reserved.
//

import UIKit

class ExpensesTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        do {
            expenses = try context.fetch(Expense.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return expenses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        let expense = expenses[indexPath.row]
        
        if let name = expense.name {
            cell.expenseNameLabel?.text = name
        }
        cell.expenseAmountLabel.text = "\(expense.amount)"

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let expense = expenses[indexPath.row]
            context.delete(expense)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                expenses = try context.fetch(Expense.fetchRequest())
            } catch {
                print("Fetch Failed")
            }
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}

class ExpenseCell: UITableViewCell {
    @IBOutlet weak var expenseNameLabel: UILabel!
    @IBOutlet weak var expenseAmountLabel: UILabel!
    
}
