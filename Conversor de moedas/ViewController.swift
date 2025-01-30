//
//  ViewController.swift
//  Conversor de moedas
//
//  Created by Pedro Henrique Freire de Oliveira on 14/01/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let currencies = Coins.allCases
    let converter = Converter()
    
    var selectedFromCurrency: Coins = .USD
    var selectedToCurrency: Coins = .BRL
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func ConvertButton(_ sender: Any) {
        resultLabel.isHidden = false
        guard let amountText = amountTextField.text?.replacingOccurrences(of: ",", with: "."),
              let amount = Double(amountText) else {
            amountTextField.text = "Valor inválido"
            resultLabel.isHidden = true
            return
        }
        
        let result = converter.convert(amount: amount, from: selectedFromCurrency, to: selectedToCurrency)
        resultLabel.text = String("\(result) \(selectedToCurrency.rawValue)").replacingOccurrences(of: ".", with: ",")
    }
    
    
    func setup() {
        fromPickerView.delegate = self
        fromPickerView.dataSource = self
        toPickerView.delegate = self
        toPickerView.dataSource = self
        
        amountTextField.delegate = self
        amountTextField.keyboardType = .decimalPad
        addDoneKeyboardButton()
        
        resultLabel.isHidden = true
        
        fromPickerView.selectRow(2, inComponent: 0, animated: false)
        toPickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    func addDoneKeyboardButton(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [spacer, doneButton]
        
        amountTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }


}
