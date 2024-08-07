//
//  MainEntity.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

typealias MovieItems = [MainEntity.MovieItem]

enum MainEntity {
   
    struct MovieItem: Equatable {
        let title: String
        let releaseDate: String
        let posterPath: String
        let movieId: String
        let popularity: String
    }
}
