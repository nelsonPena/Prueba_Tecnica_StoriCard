//
//  Environment.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

final class Enviroment {
    static let shared = Enviroment()
    private var plistEnvitoment : Dictionary<String, Any> = [:]
    private static let keyEnviromentURLKeyBaseUrl = "BaseURL"
    private static let keyEnviromentURLKeyAccessToken = "AccessToken"
    private static let keyEnviromentURLKeyImgBaseUrl = "ImgBaseUrl"
    
    
    // MARK: - Init
    
    private init() {
        if let plist =  Bundle.main.infoDictionary {
            plistEnvitoment = plist
        }
    }
    
    var baseURL: String {
        return plistEnvitoment[Enviroment.keyEnviromentURLKeyBaseUrl] as! String
    }
    
    var accessToken: String {
        return plistEnvitoment[Enviroment.keyEnviromentURLKeyAccessToken] as! String
    }
    
    var imgBaseURL: String {
        return plistEnvitoment[Enviroment.keyEnviromentURLKeyImgBaseUrl] as! String
    }
}
