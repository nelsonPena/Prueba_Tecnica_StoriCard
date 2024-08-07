//
//  BasePresenter.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol BaseInteractorOutputProtocol {
    func loadingView(isHidden: Bool)
    func showError(with baseError: DomainErrorEntity)
}

class BasePresenter {
    // MARK: - Properties
    weak var baseView: BaseViewControllerProtocol?
    
    init(baseView: BaseViewControllerProtocol) {
        self.baseView = baseView
    }

    // MARK: - BaseInteractorOutputProtocol
    
    func showError(with baseError: DomainErrorEntity) {
        baseView?.hideLoading()
        baseView?.show(error: PresentableErrorMapper().map(error: baseError))
    }
    
    func loadingView(isHidden: Bool) {
        if isHidden { baseView?.hideLoading() }
        else { baseView?.showLoading() }
    }
}
