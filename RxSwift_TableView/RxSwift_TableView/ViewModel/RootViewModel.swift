//
//  RootViewModel.swift
//  RxSwift_TableView
//
//  Created by SeungYeon Yoo on 2023/02/19.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "Tesla News"
    
    private let articleService: ArticleServiceProtocol //타입으로 가지고 있는게 확장성에 좋음
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        return articleService.fetchNews().map { $0.map { ArticleViewModel(article: $0)} }
    }
}
