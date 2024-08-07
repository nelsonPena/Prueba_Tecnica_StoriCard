//
//  BaseWireframeProtocol.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import Foundation

protocol BaseWireframeProtocol: AnyObject {
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func present()
    
    func presentModal()
    
    func push()
}

extension BaseWireframeProtocol {
    
    func present() {
        print("ERROR: method not implemented")
    }
    
    func presentModal(){
        print("ERROR: method not implemented")
    }
    
    func push(){
        print("ERROR: method not implemented")
    }
}
