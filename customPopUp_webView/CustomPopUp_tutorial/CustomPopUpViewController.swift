//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by SeungYeon Yoo on 2022/04/25.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewControler - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
    }
    
    
    @IBAction func bgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewControler - bgBtnCliked() called")
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewControler - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
       
        //컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            //메인에 알린다.
            subscribeBtnCompletionClosure()
        }
        
    }
}
