//
//  ViewController.swift
//  Combine_Login
//
//  Created by SeungYeon Yoo on 2023/09/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var myBtn: UIButton!
    
    var viewModel: MyViewModel!
    
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MyViewModel()
        
        //텍스트필드에서 나가는 이벤트를 뷰모델의 프로퍼티가 구독
        passwordTextField
            .myTextPublisher
            .print()
            .receive(on: RunLoop.main) //다른 thread와 같이 작업하기 때문에 runLoop로 돌림
            .assign(to: \.passwordInput, on: viewModel) //구독
            .store(in: &mySubscriptions)
        
        passwordConfirmTextField
            .myTextPublisher
            .print()
            .receive(on: RunLoop.main) //다른 thread와 같이 작업하기 때문에 runLoop로 돌림
            .assign(to: \.passwordConfirmInput, on: viewModel) //구독
            .store(in: &mySubscriptions)
        
        //버튼이 뷰모델의 퍼블리셔를 구독
        viewModel.isMatchPasswordInput
            .print()
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: myBtn) //구독
            .store(in: &mySubscriptions)
    }
}

extension UITextField {
    
    //private이 아니고 public이기 때문에 위에 VC 의 textfield에서 바로 접근 가능
    var myTextPublisher: AnyPublisher<String, Never> {
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
//            .print()
            .compactMap { $0.object as? UITextField } //UITextField 가져옴
            .map { $0.text ?? "" } //String 가져옴
            .print()
            .eraseToAnyPublisher()
        
    }
}

extension UIButton {
    var isValid: Bool {
        get {
            backgroundColor == .yellow
        }
        set {
            backgroundColor = newValue ? .yellow : .lightGray //isValid로 들어오는 값이 true이면 yellow, false면 lightGray
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white , for: .normal)
            
        }
    }
}
