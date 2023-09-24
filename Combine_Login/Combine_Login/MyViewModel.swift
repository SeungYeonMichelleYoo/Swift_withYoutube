//
//  MyViewModel.swift
//  Combine_Login
//
//  Created by SeungYeon Yoo on 2023/09/24.
//

import Foundation
import Combine

class MyViewModel {
    
    //Published 어노테이션을 통해 구독이 가능하도록 설정
    @Published var passwordInput: String = "" {
        didSet {
            print("MyViewModel / passwordInput: \(passwordInput)")
        }
    }
    @Published var passwordConfirmInput: String = "" {
        didSet {
            print("MyViewModel / passwordConfirmInput: \(passwordConfirmInput)")
        }
    }
    
    // 들어온 퍼블리셔들의 값 일치 여부를 반환하는 퍼블리셔 (퍼블리셔들 값 변경될 때마다 발산)
    lazy var isMatchPasswordInput: AnyPublisher<Bool, Never> = Publishers
        .CombineLatest($passwordInput, $passwordConfirmInput) //publisher로 가져오므로 $ 을 붙인다.
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            if password == passwordConfirm {
                return true
            } else {
                return false
            }
        })
        .print()
        .eraseToAnyPublisher()

}
