//
//  CountryCodePicker.swift
//  CountryCode
//
//  Created by KK Chen on 15/1/2017.
//  Copyright © 2017 bichenkk. All rights reserved.
//

import UIKit

public class CountryCodePicker: UIPickerView {
    
    public var selectedCountry: String {
        get {
            return selectedCountryCodeItem.keys.first!
        }
    }
    
    public var selectedCountryCode: String {
        get {
            return selectedCountryCodeItem.values.first!
        }
    }
    
    public var selectedCountryCodeItem: [String: String] {
        get {
            let row = selectedRow(inComponent: 0)
            let codeItem = CountryCode.codes[row]
            return codeItem
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUp()
    }
    
    func setUp() {
        delegate = self
        dataSource = self
    }
    
}

extension CountryCodePicker : UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard row < CountryCode.codes.count, let country = CountryCode.codes[row].keys.first, let code = CountryCode.codes[row].values.first else {
            return nil
        }
        return "\(country) \(code)"
    }
    
}

extension CountryCodePicker : UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CountryCode.codes.count
    }
    
}
