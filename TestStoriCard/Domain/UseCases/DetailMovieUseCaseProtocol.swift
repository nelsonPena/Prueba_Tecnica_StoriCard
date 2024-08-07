//
//  DetailMovieProtocol.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

protocol DetailMovieUseCaseProtocol {
    func getMovieDetail(movieId: String) async throws -> MovieDetailEntity
    func getMovieTrailers(movieId: String) async throws -> TrailerEntity?
}
