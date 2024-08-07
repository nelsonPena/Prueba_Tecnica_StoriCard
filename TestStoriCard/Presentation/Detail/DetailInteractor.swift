//
//  DetailInteractor.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

protocol DetailInteractorProtocol {
    func getDetails()
    func set(presenter: DetailInteractorOutputProtocol)
}

class DetailInteractor {
    
    private let useCase: DetailMovieUseCaseProtocol
    private var presenter: DetailInteractorOutputProtocol?
    var movieId: String?
    
    init(useCase: DetailMovieUseCaseProtocol, movieId: String?) {
        self.useCase = useCase
        self.movieId = movieId
    }
}

extension DetailInteractor: DetailInteractorProtocol {
    
    func set(presenter: DetailInteractorOutputProtocol){
        self.presenter = presenter
    }
    
    func getDetails() {
        Task {
            do{
                guard let movieId else {
                    presenter?.showError(with: .generic)
                    return
                }
                let detail = try await self.useCase.getMovieDetail(movieId: movieId)
                let detailPresentableModel = detail.mapper()
                DispatchQueue.main.sync { [weak self] in
                    guard let self = self else { return }
                    self.presenter?.showDetail(with: detailPresentableModel)
                }
                let trailer = try await self.useCase.getMovieTrailers(movieId: movieId)
                DispatchQueue.main.sync { [weak self] in
                    guard let self = self else { return }
                    self.presenter?.loadTriler(with: trailer?.mapper())
                }
            } catch {
                DispatchQueue.main.sync {
                    presenter?.showError(with: error as! DomainErrorEntity)
                }
            }
        }
    }
}
