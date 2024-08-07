//
//  UILabel+Util.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

extension UILabel {
    
    func config(text: String? = nil, font: UIFont?, color: UIColor) {
        text.map { self.text = $0 }
        self.font = font
        self.textColor = color
    }
}
