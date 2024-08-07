//
//  TrailersDTO.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 6/08/24.
//

import Foundation

struct TrailersDTO: Decodable {
    let results: [TrailersResults]
}

struct TrailersResults: Decodable {
    let key: String
    let site: String
}

extension TrailersResults {
    func mapper() -> TrailerEntity {
        .init(
            key: self.key
        )
    }
}
