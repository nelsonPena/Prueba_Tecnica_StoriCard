//
//  URLSessionErrorResolver.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

class URLSessionErrorResolver {
    
    func resolve(statusCode: Int) -> HttpClientError {
        guard statusCode != 429 else {
            return .tooManyRequests
        }
        
        guard statusCode >= 500 else {
            return .clientError
        }
        
        return .serverError
    }
    
    func resolve(error: Error) -> HttpClientError {
        return .generic
    }
}
