//
//  SceneCoordinatorType.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/03/05.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
