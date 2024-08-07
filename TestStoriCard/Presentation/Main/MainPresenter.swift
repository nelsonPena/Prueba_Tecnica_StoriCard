//
//  MainViewPresenter.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol MainPresenterProtocol {
    func loadTable()
    func nextPageTriggered()
    func showDetail(with movieId: String)
}

protocol MainInteractorOutputProtocol: AnyObject, BaseInteractorOutputProtocol {
    func showMovies(movies: MovieItems, reseted: Bool)
}

class MainPresenter: BasePresenter {
    
    private unowned var view: MainViewController
    private let interactor: MainInteractorProtocol
    private let router: MainRouterProtocol
    
    init(view: MainViewController, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        super.init(baseView: view)
    }
}

extension MainPresenter: MainPresenterProtocol {
    
    func loadTable() {
        view.startSkeletonLoading(animated: false)
        self.interactor.getTopRated()
    }
    
    func showDetail(with movieId: String) {
        router.goToDetail(with: movieId)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
  
    func showMovies(movies: MovieItems, reseted: Bool) {
        view.appendMovies(movies, reseted: reseted)
    }
    
    func nextPageTriggered() {
        self.interactor.getTopRated()
    }
}
