//
//  MainViewRouter.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol MainRouterProtocol {
    func goToDetail(with movieId: String)
}

class MainRouter {
    
    private let detailWireframe: DetailWireframe
    
    init(detailWireframe: DetailWireframe) {
        self.detailWireframe = detailWireframe
    }
}

extension MainRouter: MainRouterProtocol {
    
    func goToDetail(with movieId: String) {
        detailWireframe.push(with: movieId)
    }
}
