//
//  TransitionModel.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/03/05.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
