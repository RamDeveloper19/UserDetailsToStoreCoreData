//
//  AlertHelper.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(_ title : String? = nil , message: String? = nil){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        if let title = title {
            let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
            let titleAttrString = NSAttributedString(string: title, attributes: titleFont)
            alert.setValue(titleAttrString, forKey: "attributedTitle")
        }
        if let message = message {
            let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
            let messageAttrString = NSAttributedString(string: message, attributes: messageFont)
            alert.setValue(messageAttrString, forKey: "attributedMessage")
        }
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
