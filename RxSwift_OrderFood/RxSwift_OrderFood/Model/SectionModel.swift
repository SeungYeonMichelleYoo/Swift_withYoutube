//
//  SectionModel.swift
//  RxSwift_OrderFood
//
//  Created by SeungYeon Yoo on 2023/02/15.
//

import Foundation
import RxDataSources

struct SectionModel {
    var header: String
    var items: [Food]
}

extension SectionModel: SectionModelType {
    init(original: SectionModel, items: [Food]) {
        self = original
        self.items = items
    }
}
