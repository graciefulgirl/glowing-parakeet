//
//  AddExpenseViewController.swift
//  TrippitySplit
//
//  Created by admin on 11/8/17.
//  Copyright © 2017 graciefulgirl. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {
    @IBOutlet weak var expenseNameTextField: UITextField!

    @IBOutlet weak var expenseAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addExpenseButtonTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let expense = Expense(context: context) // Link Expense & Context
        expense.name = expenseNameTextField.text!
        if !(expenseAmountTextField.text?.isEmpty)! {
            expense.amount = Double(expenseAmountTextField.text!)!

        }
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
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
