//
//  MovieDetailEntiy.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

struct MovieDetailDTO: Decodable {
    let original_language: String
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let tagline: String
    let vote_average: Decimal
   
}

extension MovieDetailDTO {
    func mapper() -> MovieDetailEntity {
        .init(
            originalLanguage: self.original_language,
            title: self.title,
            overview: self.overview,
            posterPath: self.poster_path,
            releaseDate: self.release_date,
            tagline: self.tagline,
            voteAverage: self.vote_average
        )
    }
}
