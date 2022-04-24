//
//  ViewController.swift
//  Completion Block-Tutorial
//
//  Created by SeungYeon Yoo on 2022/04/24.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    //mainTitle = '안녕하세요' 라벨 가져온거임
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController -viewDidLoad() 호출됨 ")
        
        KRProgressHUD.show()
        
        sayHi(completion:{ result in
            print("completion block으로 넘겨 받았음: \(result)")
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
    }
    
    fileprivate func sayHi(completion: @escaping(String) -> ()){
        
        print("ViewController - sayHi() 호출됨")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
           // print("하이")
            completion("하이")
        }
    }
}

