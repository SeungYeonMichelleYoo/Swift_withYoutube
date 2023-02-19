//
//  ArticleService.swift
//  RxSwift_TableView
//
//  Created by SeungYeon Yoo on 2023/02/19.
//

import Foundation
import Alamofire
import RxSwift

//확장성을 위해 프로토콜 채택
protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class ArticleService: ArticleServiceProtocol {
    
    //2. RxSwift로 입혀줌
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                if let articles = articles {
                    observer.onNext(articles)
                }
                
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    //1. 먼저 data 쭉 가져와서
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "\(Endpoint.newsURL)\(APIKey.keyAPI)"
        
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        }
    }
}
