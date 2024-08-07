//
//  MoviesDataSourceProtocol.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation


protocol MoviesDataSourceProtocol {
    func getTopRated(page: String) async throws -> MoviesResultDTO
    func getMovieDetail(movieId: String) async throws -> MovieDetailDTO
    func getMovieTrailers(movieId: String) async throws -> TrailersDTO
}
