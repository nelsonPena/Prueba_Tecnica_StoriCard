//
//  TrailerWireframe.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import Foundation

class TrailerWireframe: BaseWireframe, BaseWireframeProtocol {
    
    var keyVideo: String?
    
    var viewController: TrailerViewController  {
        let vc = TrailerViewController(nibName: "TrailerViewController", bundle: nil)
        vc.set(keyVideo: keyVideo!)
        return vc
    }
    
    func present(with keyVideo: String) {
        self.keyVideo = keyVideo
        super.presentModal(viewController: viewController)
    }
}
