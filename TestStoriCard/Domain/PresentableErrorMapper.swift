//
//  PresentableErrorMapper.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

class PresentableErrorMapper {
  
    func map(error: DomainErrorEntity?) -> String {
        switch error {
        case .badServerResponse:
            return "try_later_text_error".localized
        case .timeOut:
            return "no_internet_error".localized
        default:
            return "generic_text_error".localized
        }
       
    }
}
