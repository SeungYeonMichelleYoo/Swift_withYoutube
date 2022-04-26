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
    @IBOutlet weak var openChatBtn: UIButton!
    @IBOutlet weak var blogBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    var myPopUpDelegate : PopUpDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewControler - viewDidLoad() called")
        
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
    }
    
    //MARK: = IBActions
    @IBAction func onBlogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewControler -onBlogBtnClicked() called")
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        dismiss(animated: true, completion: nil)
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
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewControler - onOpenChatBtnClicked() called")
        
        //리모콘 버튼을 눌러서 여기서 발동이 되는 것임 - 수신하는 곳: View Controller
        myPopUpDelegate?.onOpenChatBtnClicked()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
