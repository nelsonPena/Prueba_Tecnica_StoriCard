//
//  LoadingScreen.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit

class LoadingScreen: UIView, Nibbable {
    
    // MARK: Nibbable protocol
    var view: UIView!
    
    private let loadingText: String
    private let transparency: CGFloat
    
    @IBOutlet weak var lbLoading: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Object lifecycle
    
    init(loadingText: String = "", transparency: CGFloat = 0.8) {
        self.loadingText = loadingText
        self.transparency = transparency
        
        super.init(frame: UIScreen.main.bounds)
        
        viewFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
        backgroundColor = UIColor.black
        alpha = transparency
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        lbLoading.addGestureRecognizer(gesture)
        lbLoading.isUserInteractionEnabled = true
    }
    
    // MARK: Public methods
    
    func show() {
        guard let window = AppWindow.shared.window else { return }
        alpha = 1
        
        if self.superview == nil {
            window.addSubview(self)
            loadingIndicator.startAnimating()
        }
    }
    
    @objc func hide(animated: Bool = true) {
        if animated == true {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alpha = 0
                }, completion: { (finished) in
                    if self.superview != nil, finished {
                        self.loadingIndicator.stopAnimating()
                        self.removeFromSuperview()
                    }
                })
            }
        } else {
            self.loadingIndicator.stopAnimating()
            self.removeFromSuperview()
        }
    }
    
    deinit {
        loadingIndicator.stopAnimating()
        removeFromSuperview()
    }
}

