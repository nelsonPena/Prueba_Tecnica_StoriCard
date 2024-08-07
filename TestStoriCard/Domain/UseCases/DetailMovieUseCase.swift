//
//  DetailMovie.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

class DetailMovieUseCase {
   
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
}

extension DetailMovieUseCase: DetailMovieUseCaseProtocol {
    
    func getMovieDetail(movieId: String) async throws -> MovieDetailEntity {
        do {
           return try await repository.getMovieDetail(movieId: movieId)
        } catch {
            throw error
        }
    }
    
    func getMovieTrailers(movieId: String) async throws -> TrailerEntity? {
        do {
           return try await repository.getMovieTrailers(movieId: movieId)
        } catch {
            throw error
        }
    }
}
