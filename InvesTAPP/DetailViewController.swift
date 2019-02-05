//
//  DetailViewController.swift
//  InvesTAPP
//
//  Created by User on 12/2/17.
//  Copyright © 2017 Zerocool. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
    var bankRateOne = 3.3, bankRateTwo = 6.7, bankRateThree = 2.5, bankRateFour = 8.2

     var bankRateSelected = String()
    

   /* @IBAction func amountTextBox(_ sender: UITextField) {
        let digits = sender.text?.lowercased() ?? "0"
        sender.text = "\(digits)" + ".00"
        
    }
    */
    
    
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tenureTextBox: UITextField!
    @IBOutlet weak var tenureDropDown: UIPickerView!
    
    @IBOutlet weak var bankTextBox: UITextField!
    @IBOutlet weak var bankDropDowm: UIPickerView!
    
    var list = [String]()
    
    var tenArray = [String]()
    
    var monthOptions = [Int]()
    
   
    
    @IBOutlet weak var amountLabel: UILabel!
    
    
    
    @IBAction func getNewAmount(_ sender: UIButton) {
        let newAmountResult: String = amountField.text!
        var bankRateValue: Double = 3.50
        
        var newBankRate: String = bankTextBox.text!
        
        var newTenureRate: String = tenureTextBox.text!
        
        
        
       // var totalbankRateOne = Double()
        
       // totalbankRateOne = Double(newBankRate)!
        
        //let string = NSString(string: newBankRate)
        //string.doubleValue
        
       
        
         var totalbankRateOne = (newBankRate as NSString).doubleValue
        
         var totaltenureRateOne = (newTenureRate as NSString).doubleValue
       
        
        //print(totalbankRateOne)
        
         //totalbankRateOne = 3.5
        
        //double = 3.5
        
        
        
        
    switch newBankRate {
        case "JPMorgan Chase - 3.3/month":
            totalbankRateOne = 3.3
        case "Bank of America - 6.7/month":
            totalbankRateOne = 6.7
        case "Wells Fargo - 2.5/month":
            totalbankRateOne = 2.5
        case "Citigroup - 8.2/month":
            totalbankRateOne = 8.2
        default:
            totalbankRateOne = 0
        }

       
    switch newTenureRate {
    case "90 days":
        totaltenureRateOne = totalbankRateOne * 3.0
    case "6 months":
        totaltenureRateOne = totalbankRateOne * 6
    case "1 year":
        totaltenureRateOne = totalbankRateOne * 12
    case "5 years":
        totaltenureRateOne = totalbankRateOne * 60
        default:
            totaltenureRateOne = 0
        }
    
        
      //  if (newBankRate == "Bank of America - 6.7/month"){
        //   totalbankRateOne = 3.5
        //}
        
        
        if let total = Double(newAmountResult) {
            bankRateValue = total * totaltenureRateOne
            
            
        }

        amountLabel.text = "Your Future Amount is : \(bankRateValue)" + "0"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountField.delegate = self
        amountField.addTarget(self, action: #selector(self.textFieldChanged), for: UIControlEvents.editingChanged)
        
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        
        amountField.inputAccessoryView = toolBar
      
        
        
       let pickerView = UIPickerView()
        
        pickerView.tag = 1
        
        let pickerView2 = UIPickerView()
        
        pickerView.delegate = self
        pickerView2.delegate = self
        
        bankTextBox.inputView = pickerView
        tenureTextBox.inputView = pickerView2
        
        list = ["JPMorgan Chase - 3.3/month", "Bank of America - 6.7/month", "Wells Fargo - 2.5/month", "Citigroup - 8.2/month"]
        
        tenArray = ["90 days", "6 months", "1 year", "5 years"]
        
        monthOptions = [3, 6, 12, 60]
    }
    


    
    
    
    
    @objc func textFieldChanged(textField: UITextField) {
        
        var text = amountField.text?.replacingOccurrences(of: ".00", with: "")
        text = text! + ".00"
        amountField.text = text
    }
    
    @objc func doneClicked() {
        
        view.endEditing(true)
    }
    
    
    
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent Component: Int) -> Int {
        
        if (pickerView.tag == 1){
            return list.count
        } else {
            return tenArray.count
        }
        
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       //  if let bankTextBox = self.view.viewWithTag(1) as? UITextField {
        //}
        if (pickerView.tag == 1){
             return "\(list[row])"
        } else {
           return "\(tenArray[row])"
        }
        
        
        
       
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       
        var tenureSelected = String()
        
       if (pickerView.tag == 1){
        self.bankTextBox.text = self.list[row]
        self.bankDropDowm.isHidden = true
        self.view.endEditing(true)

       
        
       // let bankRateValue = Int(list.insert(3, at: 0))
        
      /*  var convert1 = Double(list[0])
        var convert2 = Double(list[1])
        var convert3 = Double(list[2])
        var convert4 = Double(list[3])
        
        convert1 = bankRateOne
        convert2 = bankRateTwo
        convert3 = bankRateThree
        convert4 = bankRateFour  */
        
        
        
        
        
         bankRateSelected = list[row] as String
         print(bankRateSelected)
        
        
        
        
        
        }
        
        
        
        else{
        
            self.tenureTextBox.text = self.tenArray[row]
            self.tenureDropDown.isHidden = true
            self.view.endEditing(true)
        
        tenureSelected = tenArray[row] as String
        
        print(tenureSelected)
        
        
        }
        
       // var convert1 = Double(list[0])
       // convert1 = bankRateOne
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       view.endEditing(true)
    }
    
    
    
   func textFieldDidBeginEditing(textField: UITextField, textField2: UITextField) {
        
        if textField == self.bankTextBox {
            self.bankDropDowm.isHidden = false
            textField.endEditing(true)
        }
        
            if textField2 == self.tenureTextBox {
           self.tenureDropDown.isHidden = false
            textField2.endEditing(true)
            }
    
   
        }
    
    
   
    
    
    
       /* if(bankRateSelected == list[0]) {
    
    var convert1 = Double(list[0])
    
    convert1 = bankRateOne
    
    print(convert1)
    }
    */
    
}



