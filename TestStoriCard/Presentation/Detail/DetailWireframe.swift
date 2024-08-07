//
//  DetailWireframe.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

class DetailWireframe: BaseWireframe, BaseWireframeProtocol  {
    
    private var movieId: String?
    private var httpClient: HttpClient
    
    var viewController: DetailViewController {
        
        // Generating module components
        let viewController: DetailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        let interactor: DetailInteractorProtocol = createInteractor(with: createUseCase())
        let router: DetailRouterProtocol = createRouter(trailerWireframe: trailerWireframe)
        let presenter: DetailPresenter = createPresenter(with: viewController, interactor: interactor, router: router)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var paginationCoordinator: PaginationCoodinator {
        return PaginationCoodinator()
    }
    
    private var trailerWireframe: TrailerWireframe {
        return TrailerWireframe()
    }
    
    override init(httpClient: HttpClient? = nil) {
        self.httpClient = httpClient ?? URLSessionAsyncHTTPCLient(requestMaker: UrlSessionRequestMaker(),
                                                                  errorResolver: URLSessionErrorResolver())
    }
    
    func createPresenter(with view: DetailViewController, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) -> DetailPresenter {
        DetailPresenter(view: view, interactor: interactor, router: router)
    }
    
    func createInteractor(with useCase: DetailMovieUseCaseProtocol) -> DetailInteractor {
        DetailInteractor(useCase: useCase, movieId: movieId)
    }
    
    func createRouter(trailerWireframe: TrailerWireframe) -> DetailRouterProtocol {
        DetailRouter(trailerWireframe: trailerWireframe)
    }
    
    func createUseCase() -> DetailMovieUseCaseProtocol {
        return DetailMovieUseCase(repository: createRepository())
    }
    
    func createRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(apiDataSource: createDataSource())
    }
    
    func createDataSource() -> MoviesDataSourceProtocol {
        return MoviesDataSource(httpClient: httpClient)
    }
    
    func push(with movieId: String) {
        self.movieId = movieId
        super.push(viewController: viewController)
    }
}
