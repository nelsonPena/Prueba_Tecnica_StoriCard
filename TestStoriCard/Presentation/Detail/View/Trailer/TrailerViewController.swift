//
//  TrailerViewController.swift
//  Test_Knowledge
//
//  Created by Nelson Geovanny Pena Agudelo on 26/10/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    private var keyVideo: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.layer.cornerRadius = 10
        webView.configuration.allowsAirPlayForMediaPlayback = true
        let youtubeURL = URL(string: "https://www.youtube.com/embed/" + keyVideo!)
        webView.load(URLRequest(url: youtubeURL!))
    }
    
    func set(keyVideo: String) {
        self.keyVideo = keyVideo
    }

    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

