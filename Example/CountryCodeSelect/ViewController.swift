//
//  ViewController.swift
//  CountryCodeSelect
//
//  Created by KK Chen on 01/15/2017.
//  Copyright (c) 2017 KK Chen. All rights reserved.
//

import UIKit
import CountryCodeSelect

class ViewController: UIViewController {
    
    @IBOutlet weak var countryCodeField: UITextField!
    
    lazy var countryCodePickerView: CountryCodePicker! = {
        let pickerView = CountryCodePicker()
        return pickerView
    }()
    
    lazy var countryCodePickerViewToolbar: UIToolbar! = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                         UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed(_:)))]
        return toolbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countryCodeField.inputView = countryCodePickerView
        countryCodeField.inputAccessoryView = countryCodePickerViewToolbar
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        countryCodeField.text = countryCodePickerView.selectedCountryCode
        countryCodeField.resignFirstResponder()
    }
    
}

