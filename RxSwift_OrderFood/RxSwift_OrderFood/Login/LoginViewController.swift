//
//  LoginViewController.swift
//  RxSwift_OrderFood
//
//  Created by SeungYeon Yoo on 2023/02/15.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        loginBtn.rx.tap
            .withLatestFrom(Observable.combineLatest(userNameTextField.rx.text.orEmpty, passwordTextField.rx.text.orEmpty))
            .subscribe(onNext: {
                self.login(user: $0, pass: $1)
            })
            .disposed(by: disposeBag)
    }
    

    func login(user: String, pass: String) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let emailValid: Bool = emailTest.evaluate(with: user)
        let passValid: Bool = (pass != "" && pass.count >= 6)
        
        if (emailValid && passValid) {
            let foodListVC = self.storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
            self.navigationController?.pushViewController(foodListVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Wrong Credentials", message: "이메일과 비밀번호를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler : nil )
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
