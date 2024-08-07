//
//  GetTopRatedMovies.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

class MainListMoviesUseCase {
   
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
}

extension MainListMoviesUseCase: MainListMoviesUseCaseProtocol {
    
    func getTopRated(page: String) async throws -> MoviesEntity {
        do {
           return try await repository.getTopRated(page: page)
        } catch {
            throw error
        }
    }
}
