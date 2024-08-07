//
//  MoviesRepository.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

class MoviesRepository {
    
    private let apiDataSource: MoviesDataSourceProtocol
    
    init(apiDataSource: MoviesDataSourceProtocol) {
        self.apiDataSource = apiDataSource
    }
}

extension MoviesRepository: MoviesRepositoryProtocol {
   
    func getTopRated(page: String) async throws -> MoviesEntity {
        do {
            let moviesResult = try await apiDataSource.getTopRated(page: page)
            return moviesResult.mapper()
        } catch {
            throw (error as! HttpClientError).map()
        }
    }
    
    func getMovieDetail(movieId: String) async throws -> MovieDetailEntity {
        do {
            let movieDetail = try await apiDataSource.getMovieDetail(movieId: movieId)
            return movieDetail.mapper()
        } catch {
            throw (error as! HttpClientError).map()
        }
    }
    
    func getMovieTrailers(movieId: String) async throws -> TrailerEntity? {
        do {
            let trailer = try await apiDataSource.getMovieTrailers(movieId: movieId)
            return trailer.results.first?.mapper() 
        } catch {
            throw (error as! HttpClientError).map()
        }
    }
}
