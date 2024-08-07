//
//  MainWireframe.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation
import UIKit

class MainWireframe: BaseWireframe, BaseWireframeProtocol {
    
    var viewController: MainViewController {
        
        // Generating module components
        let viewController: MainViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        
        let interactor: MainInteractorProtocol = createInteractor(with: createUseCase())
        let router: MainRouterProtocol = createRouter()
        let presenter: MainPresenter = createPresenter(with: viewController, interactor: interactor, router: router)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var paginationCoordinator: PaginationCoodinator {
        return PaginationCoodinator()
    }
    
    private var detailWireframe: DetailWireframe {
        return DetailWireframe()
    }
    
    private var httpClient: HttpClient
    
    override init(httpClient: HttpClient? = nil) {
        self.httpClient = httpClient ?? URLSessionAsyncHTTPCLient(requestMaker: UrlSessionRequestMaker(),
                                                                  errorResolver: URLSessionErrorResolver())
    }
    
    func createPresenter(with view: MainViewController, interactor: MainInteractorProtocol, router: MainRouterProtocol) -> MainPresenter {
        MainPresenter(view: view, interactor: interactor, router: router)
    }
    
    func createInteractor(with useCase: MainListMoviesUseCaseProtocol) -> MainInteractor {
        MainInteractor(useCase: useCase, paginationCoordinator: paginationCoordinator)
    }
    
    func createRouter() -> MainRouterProtocol {
        MainRouter(detailWireframe: detailWireframe)
    }
    
    func createUseCase() -> MainListMoviesUseCaseProtocol {
        return MainListMoviesUseCase(repository: createRepository())
    }
    
    func createRepository() -> MoviesRepositoryProtocol {
        return MoviesRepository(apiDataSource: createDataSource())
    }
    
    func createDataSource() -> MoviesDataSourceProtocol {
        return MoviesDataSource(httpClient: httpClient)
    }
    
    func present() {
        guard let window = AppWindow.shared.window else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
    }
}
