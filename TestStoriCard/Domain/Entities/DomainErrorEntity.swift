//
//  PokemonListDomainError.swift
//  PokeApp
//
//  Created by Nelson Geovanny Pena Agudelo on 14/10/23.
//

import Foundation

enum DomainErrorEntity: Error {
    case badServerResponse
    case timeOut
    case generic
}
