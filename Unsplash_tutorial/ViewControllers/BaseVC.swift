//
//  BaseVC.swift
//  Unsplash_tutorial
//
//  Created by SeungYeon Yoo on 2022/04/28.
//

import UIKit

class BaseVC: UIViewController {
    
    var vcTitle : String = "" {
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
            self.title = vcTitle
        }
    }
    
}
