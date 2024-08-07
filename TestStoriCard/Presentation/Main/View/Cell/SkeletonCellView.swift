//
//  SkeletonCellView.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

class SkeletonCellView: UIView, Nibbable  {
    var view: UIView!
    private static let height: CGFloat = 150
    
    init(_ frame: CGRect? = nil) {
        let frameToUse = frame ?? CGRect(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: SkeletonCellView.height))
        
        super.init(frame: frameToUse)
        
        viewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        viewFromNib()
    }
}
