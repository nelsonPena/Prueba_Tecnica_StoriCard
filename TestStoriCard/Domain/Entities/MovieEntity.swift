//
//  Movies.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//
import Foundation

typealias MoviesEntity = [MovieEntity]

// MARK: - Result
struct MovieEntity: Codable {
    let id: Int
    let popularity: Double
    let posterPath, releaseDate, title: String

    enum CodingKeys: String, CodingKey {
        case id
        case popularity
        case posterPath
        case releaseDate
        case title
    }
}


extension MovieEntity {
    
    func mapper() -> MainEntity.MovieItem {
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        let popularity = formatter.string(for: self.popularity) ?? "?"
        
       return .init(
            title: self.title,
            releaseDate: self.releaseDate,
            posterPath: self.posterPath,
            movieId: self.id.description,
            popularity: popularity
        )
    }
}

