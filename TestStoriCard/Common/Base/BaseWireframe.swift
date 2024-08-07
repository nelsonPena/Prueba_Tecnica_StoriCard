//
//  BaseWireframe.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit

class BaseWireframe {
    
    init(httpClient: HttpClient? = nil) {
        
    }

    func presentModal(viewController: UIViewController) {
        if let vc = UIViewController.getCurrentNavigationController() {
            viewController.modalPresentationStyle = .popover
            vc.present(viewController, animated: true)
        }
    }
    
    func push(viewController: UIViewController) {
        if let nav = UIViewController.getCurrentNavigationController() {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
