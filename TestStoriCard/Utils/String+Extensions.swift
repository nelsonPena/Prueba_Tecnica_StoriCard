//
//  String+Extensions.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: self)
    }
    
    func getDateFormatter() -> DateFormatter {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd"
       return dateFormatter
   }
   
    func toDate() -> Date{
        guard let date = getDateFormatter().date(from: self) else { return Date() }
       return date
   }
}
