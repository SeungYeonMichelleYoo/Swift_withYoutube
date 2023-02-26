//
//  Memo.swift
//  RxSwift_Memo
//
//  Created by SeungYeon Yoo on 2023/02/26.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    //update된 내용으로 새로운 메모 인스턴스를 만들 때 사용
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
