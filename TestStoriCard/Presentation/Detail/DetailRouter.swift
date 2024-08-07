//
//  DetailRouter.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

protocol DetailRouterProtocol {
    func showTrailer(with keyVideo: String)
}

class DetailRouter {
    
    private let trailerWireframe: TrailerWireframe
    
    init(trailerWireframe: TrailerWireframe) {
        self.trailerWireframe = trailerWireframe
    }
}

extension DetailRouter: DetailRouterProtocol {

    func showTrailer(with keyVideo: String) {
        trailerWireframe.present(with: keyVideo)
    }
}
