//
//  UIFont+Style.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

struct Font {

    static let caviarDreamsRegular : String = "cream"

    static let fontTextSizeXXXXS : CGFloat = 8
    static let fontTextSizeXXXS : CGFloat = 10
    static let fontTextSizeXXXSPlus : CGFloat = 11
    static let fontTextSizeXXS : CGFloat = 12
    static let fontTextSizeXXSPlus: CGFloat = 13
    static let fontTextSizeXS : CGFloat = 14
    static let fontTextSizeS : CGFloat = 16
    static let fontTextSizeM : CGFloat = 18
    static let fontTextSizeL : CGFloat = 20
    static let fontTextSizeLL : CGFloat = 22
    static let fontTextSizeXL : CGFloat = 24
    static let fontTextSizeXLL : CGFloat = 28
    static let fontTextSizeXXL : CGFloat = 30
    static let fontTextSizeXXXL : CGFloat = 40
    static let fontTextSizeXXXXL : CGFloat = 44
    static let fontTextSize5XL : CGFloat = 50
    static let fontTextSize6XL : CGFloat = 60
    static let fontTextSize9XL : CGFloat = 90
}

extension UIFont {
    
    // MARK: - caviarDreams Regular
    
    static func caviarDreamsRegularXXXXS() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXXXS)
    }
    
    static func caviarDreamsRegularXXXS() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXXS)
    }
    
    static func caviarDreamsRegularXXS() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXS)
    }
    
    static func caviarDreamsRegularXXXSPlus() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXXSPlus)
    }
    
    static func caviarDreamsRegularXXSPlus() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXSPlus)
    }

    static func caviarDreamsRegularXS() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXS)
    }

    static func caviarDreamsRegularS() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeS)
    }

    static func caviarDreamsRegularM() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeM)
    }

    static func caviarDreamsRegularL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeL)
    }
    
    static func caviarDreamsRegularLL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeLL)
    }

    static func caviarDreamsRegularXL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXL)
    }
    
    static func caviarDreamsRegularXLL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXLL)
    }

    static func caviarDreamsRegularXXL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXL)
    }
    
    static func caviarDreamsRegularXXXL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSizeXXXL)
    }
    
    
    static func caviarDreamsRegular5XL() -> UIFont? {
        return UIFont(name: Font.caviarDreamsRegular, size: Font.fontTextSize5XL)
    }
  
}

