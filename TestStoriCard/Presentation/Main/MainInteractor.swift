//
//  MainViewInteractor.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func getTopRated()
    func set(presenter: MainInteractorOutputProtocol)
}

class MainInteractor {
    
    private let useCase: MainListMoviesUseCaseProtocol
    private var presenter: MainInteractorOutputProtocol?
    
    private var paginationCoordinator: PaginationCoodinator
    
    init(useCase: MainListMoviesUseCaseProtocol,
         paginationCoordinator: PaginationCoodinator) {
        self.useCase = useCase
        self.paginationCoordinator = paginationCoordinator
    }
    
   
}

extension MainInteractor: MainInteractorProtocol {
   
    func set(presenter: any MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func getTopRated() {
        Task {
            do{
                let movies = try await self.useCase.getTopRated(page: paginationCoordinator.nextPage().description)
                let moviesPresentableModel = movies.map{ $0.mapper() } 
                DispatchQueue.main.sync { [weak self] in
                    guard let self = self else { return }
                    self.paginationCoordinator.pageLoaded()
                    let reseted = self.paginationCoordinator.currentPage == self.paginationCoordinator.firstPage + 1
                    self.presenter?.showMovies(movies: moviesPresentableModel, reseted: reseted)
                }
            } catch {
                DispatchQueue.main.sync { 
                    presenter?.showError(with: error as! DomainErrorEntity)
                }
            }
        }
    }
}
