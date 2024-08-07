//
//  UIViewController+Util.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    class func getCurrentViewController() -> UIViewController? {
        if let nav = UIViewController.getCurrentNavigationController() {
               return nav.viewControllers.last
           } else {
               guard let window = AppWindow.shared.window else {
                   return nil
               }
               return window.rootViewController
           }
    }
    
    class func getCurrentNavigationController() -> UINavigationController? {
        if let rootController = UIApplication.shared.connectedScenes
                .flatMap({ ($0 as? UIWindowScene)?.windows ?? [] })
                .first(where: { $0.isKeyWindow })?.rootViewController {
            return findNavigationController(controller: rootController)
        }
        return nil
    }
    
    private class func findNavigationController(controller: UIViewController) -> UINavigationController? {
        if let navigationController = controller as? UINavigationController {
            return navigationController
        }
        for childController in controller.children {
            if let navigationController = findNavigationController(controller: childController) {
                return navigationController
            }
        }
        return nil
    }
    
}
