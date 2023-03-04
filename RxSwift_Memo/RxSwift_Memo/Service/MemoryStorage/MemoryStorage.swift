//
//  MemoryStorage.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/02/26.
//

import Foundation
import RxSwift

//메모리에 메모를 저장
class MemoryStorage: MemoStorageType {
    private var list = [ //메모를 저장할 배열
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)), //더미데이터
        Memo(content: "Lorem ipsum", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo) //새로운 메모를 방출하는 메모를 리턴
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        store.onNext(list) //나중에 tableview와 바인딩할건데, RxSwift 쓰는 경우 reloadData() X 반드시 새로운 배열을 방출해주어야.
        
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        store.onNext(list)
        return Observable.just(memo)
    }
    
    
}
