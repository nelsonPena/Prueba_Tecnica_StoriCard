//
//  HttpCLient.swift
//  PokeApp
//
//  Created by Nelson Geovanny Pena Agudelo on 14/10/23.
//

import Foundation

protocol HttpClient {
    func makeRequest<T: Decodable>(requestModel: RequestEntity) async throws -> T  
}
