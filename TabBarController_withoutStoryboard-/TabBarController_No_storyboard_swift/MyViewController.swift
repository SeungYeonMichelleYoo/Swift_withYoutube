//
//  ViewController.swift
//  TabBarController_No_storyboard_swift
//
//  Created by SeungYeon Yoo on 2022/04/24.
//

import UIKit

class MyViewController: UIViewController {
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

