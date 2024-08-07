//
//  DetailPresenter.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

protocol DetailPresenterProtocol {
    func getDetail()
    func showTrailer(with keyVideo: String)
}

protocol DetailInteractorOutputProtocol: AnyObject, BaseInteractorOutputProtocol {
    func showDetail(with moviewDetail: DetailEntity.MovieDetail)
    func loadTriler(with trailer: DetailEntity.Trailer?)
}

class DetailPresenter: BasePresenter {
    
    private unowned var view: DetailViewController
    private let interactor: DetailInteractorProtocol
    private let router: DetailRouterProtocol
    
    init(view: DetailViewController, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        super.init(baseView: view)
    }
}

extension DetailPresenter: DetailPresenterProtocol {
   
    func getDetail() {
        view.showLoading()
        interactor.getDetails()
    }
    
    func showTrailer(with keyVideo: String) {
        router.showTrailer(with: keyVideo)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
    func showDetail(with moviewDetail: DetailEntity.MovieDetail) {
        view.hideLoading()
        view.showDetail(viewModel: moviewDetail)
    }
    
    func loadTriler(with trailer: DetailEntity.Trailer?) {
        view.loadTrailer(with: trailer?.key)
    }
}
