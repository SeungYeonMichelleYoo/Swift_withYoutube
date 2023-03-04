//
//  ViewModelBindableType.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/03/04.
//

import UIKit

//이렇게 해놓으면 개별 VC에서 개별 ViewModel을 불러올필요가 없어져서 그만큼 코드가 단순해짐

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
