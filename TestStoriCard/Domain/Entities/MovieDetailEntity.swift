//
//  MovieDetail.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

struct MovieDetailEntity {
    let originalLanguage: String
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let tagline: String
    let voteAverage: Decimal
}

extension MovieDetailEntity {
    func mapper() -> DetailEntity.MovieDetail {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let releaseDate = dateFormatter.string(from: self.releaseDate.toDate())
        
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        let voteAverage = formatter.string(for: self.voteAverage) ?? "?"
        
       return .init(
            originalLanguage: self.originalLanguage,
            title: self.title,
            overview: self.overview,
            posterPath: self.posterPath,
            releaseDate: releaseDate,
            tagline: self.tagline,
            voteAverage: voteAverage
        )
    }
}
