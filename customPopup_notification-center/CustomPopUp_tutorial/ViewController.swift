//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by SeungYeon Yoo on 2022/04/25.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification" //주파수의 이름

class ViewController: UIViewController, PopUpDelegate {
    

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    // notification center - 메모리 할당 뒤 마지막에 반드시 메모리 해제
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //notification 이라는 방송 수신기를 장착한다.
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }

    @objc fileprivate func loadWebView(){
        
        print("ViewController - loadWebView() called")
        let myBlogAddress = URL(string: "https://www.naver.com/")
        self.myWebView.load(URLRequest(url: myBlogAddress!))
        
    }

    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드(팝업창) 가져오기
        let storyboard = UIStoryboard.init(name: "PopUpStoryboard", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰컨트롤러가 보여지는 스타일(현재 있는 텍스트를 덮는다)
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰컨트롤러가 사라지는 스타일(스르르 사라짐)
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다. ")
            let myChannelUrl = URL(string: "https://www.youtube.com/")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        customPopUpVC.myPopUpDelegate = self
        
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
    
    //MARK: - PopUpDelegate methods
    
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called ")
        let myChannelUrl = URL(string: "https://open.kakao.com/o/gx00KJec/")
        self.myWebView.load(URLRequest(url: myChannelUrl!))
    }
    
}

