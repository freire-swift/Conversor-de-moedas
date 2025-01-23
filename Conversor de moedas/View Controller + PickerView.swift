//
//  View Controller + PickerView.swift
//  Conversor de moedas
//
//  Created by Pedro Henrique Freire de Oliveira on 22/01/25.
//
import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencies[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == fromPickerView {
                selectedFromCurrency = currencies[row]
            } else {
                selectedToCurrency = currencies[row]
            }
        }
    
}
