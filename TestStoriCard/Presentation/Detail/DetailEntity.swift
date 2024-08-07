//
//  DetailEntity.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

enum DetailEntity {
    struct MovieDetail {
        let originalLanguage: String
        let title: String
        let overview: String
        let posterPath: String
        let releaseDate: String
        let tagline: String
        let voteAverage: String
    }
    
    struct Trailer {
        let key: String
    }
}
