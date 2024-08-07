//
//  TestStoriCardTests.swift
//  TestStoriCardTests
//
//  Created by Nelson Peña Agudelo on 30/07/24.
//

import XCTest
@testable import TestStoriCard

final class TestStoriCardTests: XCTestCase {
    
    func testGetTopRated() {
        
        // Crear una instancia del cliente HTTP simulado (MockURLSessionHTTPClient)
        let mockHTTPClient = MockURLSessionHTTPClient(fileName: "mock_top_rated")
        
        // Inyectar el cliente simulado en Wireframe y crear un caso de uso
        let useCase = MainWireframe(httpClient: mockHTTPClient).createUseCase()
        
        // Crear una expectativa para el caso de prueba
        let expectation = XCTestExpectation(description: "Obtener peliculas")
        
        // Llamar a la operación asincrónica (getTopRated)
        Task{
            do{
                let movies = try await useCase.getTopRated(page: "")
                XCTAssertTrue(movies.count > 0, "Todo correcto")
                expectation.fulfill()
            }catch{
                XCTFail("Error inesperado: \(error)")
            }
        }
        
        // Esperar hasta que se cumpla la expectativa (o hasta que expire el tiempo)
        wait(for: [expectation], timeout: 5)
    }
    
    func testMovieDetail() {
        
        // Crear una instancia del cliente HTTP simulado (MockURLSessionHTTPClient)
        let mockHTTPClient = MockURLSessionHTTPClient(fileName: "detail_movie_mock")
        
        // Inyectar el cliente simulado en Wireframe y crear un caso de uso
        let useCase = DetailWireframe(httpClient: mockHTTPClient).createUseCase()
        
        // Crear una expectativa para el caso de prueba
        let expectation = XCTestExpectation(description: "Obtener los detalles")
        
        // Llamar a la operación asincrónica (getMovieDetail)
        Task{
            do{
                let movie = try await useCase.getMovieDetail(movieId: "")
                XCTAssertFalse(movie.originalLanguage.isEmpty, "El campo 'originalLanguage' está vacío")
                XCTAssertFalse(movie.title.isEmpty, "El campo 'title' está vacío")
                XCTAssertFalse(movie.overview.isEmpty, "El campo 'overview' está vacío")
                XCTAssertFalse(movie.posterPath.isEmpty, "El campo 'posterPath' está vacío")
                XCTAssertFalse(movie.releaseDate.isEmpty, "El campo 'releaseDate' está vacío")
                XCTAssertFalse(movie.tagline.isEmpty, "El campo 'tagline' está vacío")
                XCTAssertGreaterThan(movie.voteAverage, 0, "El campo 'voteAverage' debe ser mayor que 0")
                expectation.fulfill()
            }catch{
                XCTFail("Error inesperado: \(error)")
            }
        }
        
        // Esperar hasta que se cumpla la expectativa (o hasta que expire el tiempo)
        wait(for: [expectation], timeout: 5)
    }
    
    func testTrailer() {
        
        // Crear una instancia del cliente HTTP simulado (MockURLSessionHTTPClient)
        let mockHTTPClient = MockURLSessionHTTPClient(fileName: "trailer_mock")
        
        // Inyectar el cliente simulado en Wireframe y crear un caso de uso
        let useCase = DetailWireframe(httpClient: mockHTTPClient).createUseCase()
        
        // Crear una expectativa para el caso de prueba
        let expectation = XCTestExpectation(description: "Obtener trailer")
        
        // Llamar a la operación asincrónica (getMovieTrailers)
        Task{
            do{
                let trailer = try await useCase.getMovieTrailers(movieId: "")
                XCTAssertNotNil(trailer, "El objeto trailer es nulo")
                expectation.fulfill()
            }catch{
                XCTFail("Error inesperado: \(error)")
            }
        }
        
        // Esperar hasta que se cumpla la expectativa (o hasta que expire el tiempo)
        wait(for: [expectation], timeout: 5)
    }
}
