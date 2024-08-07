//
//  MockURLSessionHTTPClient.swift
//  TestStoriCardTests
//
//  Created by Nelson Peña Agudelo on 6/08/24.
//

import Foundation
@testable import TestStoriCard

class MockURLSessionHTTPClient: HttpClient {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func makeRequest<T>(requestModel: TestStoriCard.RequestEntity) async throws -> T where T : Decodable {
        
        guard let mockData = MockData().loadMockData(fromJSONFile: fileName, objetType: T.self) else {
            throw HttpClientError.generic
         }
        
        return mockData
    }
}

