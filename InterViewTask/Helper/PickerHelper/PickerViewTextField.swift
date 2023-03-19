//
//  PickerViewTextField.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import Foundation
import UIKit

class PickerViewTextField: UITextField {
    
    let pickerView = UIPickerView()
    var pickerTitle = " - Select - "
    var itemList = [String]()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
    }
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func textEdited(_ sender:PickerViewTextField) {
        self.text = pickerView.selectedRow(inComponent: 0) == 0 ? "" : itemList[pickerView.selectedRow(inComponent: 0)-1]
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.tintColor = UIColor.clear
        self.addTarget(self, action: #selector(textEdited(_:)), for: .editingChanged)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.inputView = pickerView
    }
}

extension PickerViewTextField:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemList.count + 1
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = row == 0 ?  pickerTitle : itemList[row-1]
        return NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor:row == 0 ? UIColor.gray : UIColor.black])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = row == 0 ? "" : itemList[row-1]
    }
}

