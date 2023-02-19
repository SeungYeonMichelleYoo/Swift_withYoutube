//
//  ArticleViewModel.swift
//  RxSwift_TableView
//
//  Created by SeungYeon Yoo on 2023/02/19.
//

import Foundation
struct ArticleViewModel {
    private let article: Article
    
    var imageUrl: String? {
        return article.urlToImage
    }
    
    var title: String? {
        return article.title
    }
    
    var description: String? {
        return article.description
    }
    
    init(article: Article) {
        self.article = article
    }
}
