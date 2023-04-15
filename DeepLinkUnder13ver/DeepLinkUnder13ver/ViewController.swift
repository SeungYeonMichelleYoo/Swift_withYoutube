//
//  ViewController.swift
//  DeepLinkUnder13ver
//
//  Created by SeungYeon Yoo on 2023/04/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        let message = "Hi Deep Linking"
        let path = "DeepLinkingDemo://customerdetail?id=\(message)"
        let application = UIApplication.shared
        let appUrl = URL(string: path)
        let webUrl = URL(string: "https://bluemangoglobal.com")
        
        if application.canOpenURL(appUrl!) {
            application.open(appUrl!, options: [:], completionHandler: nil)
        } else {
            application.open(webUrl!)
        }
        
    }
    
}

