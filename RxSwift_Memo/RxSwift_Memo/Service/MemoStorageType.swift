//
//  MemoStorageType.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/02/26.
//

import Foundation
import RxSwift

//CRUD
protocol MemoStorageType {
    @discardableResult //작업 결과가 필요없는 경우도 있다.
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
