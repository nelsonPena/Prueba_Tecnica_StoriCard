//
//  MoviesDataSource.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

class MoviesDataSource {
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
}
extension MoviesDataSource: MoviesDataSourceProtocol {
    
    func getTopRated(page: String) async throws -> MoviesResultDTO {
        let requestModel = RequestEntity(
            baseUrl: Enviroment.shared.baseURL,
            endPoint: "/movie/top_rated",
            queryParams: ["page": page],
            method: .get,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(Enviroment.shared.accessToken)"],
            body: nil
        )
        
        do {
            let movies: MoviesResultDTO = try await httpClient.makeRequest(requestModel: requestModel)
            return movies
        } catch {
            throw HttpClientError.serverError
        }
    }
    
    func getMovieDetail(movieId: String) async throws -> MovieDetailDTO {
        let requestModel = RequestEntity(
            baseUrl: Enviroment.shared.baseURL,
            endPoint: "/movie/\(movieId)",
            queryParams: [:],
            method: .get,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(Enviroment.shared.accessToken)"],
            body: nil
        )
        
        do {
            let movieDetail: MovieDetailDTO = try await httpClient.makeRequest(requestModel: requestModel)
            return movieDetail
        } catch {
            throw HttpClientError.serverError
        }
    }
    
    func getMovieTrailers(movieId: String) async throws -> TrailersDTO {
        let requestModel = RequestEntity(
            baseUrl: Enviroment.shared.baseURL,
            endPoint: "/movie/\(movieId)/videos",
            queryParams: [:],
            method: .get,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(Enviroment.shared.accessToken)"],
            body: nil
        )
        
        do {
            let movieDetail: TrailersDTO = try await httpClient.makeRequest(requestModel: requestModel)
            return movieDetail
        } catch {
            throw HttpClientError.serverError
        }
    }
}
