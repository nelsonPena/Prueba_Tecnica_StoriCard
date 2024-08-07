//
//  BaseViewController.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject  {
    func showLoading()
    func show(error: String) 
    func hideLoading()
    func dismissModal(completion: (()-> Void)?)
    func popToPrevious()
    func popToPrevious(animated: Bool)
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    // MARK: Properties
    
    var loadingScreen = LoadingScreen()
    var errorScreen = ErrorView()
    public var isLoading = true
    var isModal: Bool = false

    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
        
    // MARK: - BaseViewControllerProtocol
    
    func showTitle(titleError: String) {
        errorScreen.lbTitle.text = titleError
    }
    
    func show(error: String) {
        errorScreen.show(error: error)
    }
    
    func showLoading() {
        isLoading = true
        loadingScreen.show()
    }
    
    func hideLoading() {
        isLoading = false
        loadingScreen.hide()
    }
    
    func setIsModal(isModal: Bool) {
        self.isModal = isModal
    }
    
    // MARK: - navigation methods
    func dismissModal(completion: (()-> Void)? = nil) {
        self.dismiss(animated: true, completion: completion)
    }
    
    func popToPrevious(){
        popToPrevious(animated: true)
    }

    
    func popToPrevious(animated: Bool) {
        if let nav = self.navigationController { nav.popViewController(animated: animated) }
    }
}
 
