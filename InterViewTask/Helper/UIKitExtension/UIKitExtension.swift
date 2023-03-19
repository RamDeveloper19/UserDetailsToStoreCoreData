//
//  UIKitExtension.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import Foundation

extension String {
    var isValidName:Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]+$").evaluate(with:self)
    }
    var isValidEmail:Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").evaluate(with:self)
    }

}
