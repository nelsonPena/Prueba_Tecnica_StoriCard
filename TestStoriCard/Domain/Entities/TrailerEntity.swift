//
//  Trailer.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 6/08/24.
//

import Foundation

struct TrailerEntity {
    let key: String
}

extension TrailerEntity {
    func mapper() -> DetailEntity.Trailer {
        .init(key: self.key)
    }
}
