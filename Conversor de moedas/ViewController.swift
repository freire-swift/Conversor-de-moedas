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
    
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func ConvertButton(_ sender: Any) {
        resultLabel.isHidden = false
        guard let amountText = amountLabel.text?.replacingOccurrences(of: ",", with: "."),
              let amount = Double(amountText) else {
            amountLabel.text = "Valor inválido"
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
        
        amountLabel.delegate = self
        amountLabel.keyboardType = .decimalPad
        
        resultLabel.isHidden = true
        
        fromPickerView.selectRow(2, inComponent: 0, animated: false)
        toPickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }


}
