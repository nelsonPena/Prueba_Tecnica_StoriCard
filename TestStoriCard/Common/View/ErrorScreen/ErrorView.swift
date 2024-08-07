//
//  ErrorView.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit

class ErrorView: UIView, Nibbable {

    // MARK: Nibbable protocol
    var view: UIView!
    
    // MARK: - Properties
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var btDone: UIButton!
    
    
    // MARK: - Cycle live
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        viewFromNib()
        lbTitle.config(font: .caviarDreamsRegularXXXL(), color: .main)
        btDone.backgroundColor = .bottomGradient
        btDone.layer.cornerRadius = 8
        btDone.tintColor = .main
        btDone.setTitle("done_erron_button".localized, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func close(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    
    // MARK: - Public method
    
    func show(error: String) {
        lbTitle.text = error
        if let vc = UIViewController.getCurrentViewController() {
            vc.view.addSubview(self)
        }
    }
}
