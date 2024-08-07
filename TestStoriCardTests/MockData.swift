//
//  MockData.swift
//  TestStoriCardTests
//
//  Created by Nelson Peña Agudelo on 6/08/24.
//

import Foundation

class MockData {
    func loadMockData<T: Decodable>(fromJSONFile fileName: String, objetType: T.Type) -> T? {
        if let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
           let decodedData = try? JSONDecoder().decode(T.self, from: data) {
            return decodedData
        }
        return nil
    }
}
