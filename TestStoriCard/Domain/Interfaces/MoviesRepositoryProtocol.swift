//
//  MoviesRepositoryProtocol.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getTopRated(page: String) async throws -> MoviesEntity
    func getMovieDetail(movieId: String) async throws -> MovieDetailEntity
    func getMovieTrailers(movieId: String) async throws -> TrailerEntity?
}
