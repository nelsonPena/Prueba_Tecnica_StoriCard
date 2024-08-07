//
//  GetTopRatedMoviesProtocol.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol MainListMoviesUseCaseProtocol {
    func getTopRated(page: String) async throws -> MoviesEntity
}
