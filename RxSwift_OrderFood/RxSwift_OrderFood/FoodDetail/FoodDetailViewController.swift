//
//  FoodDetailViewController.swift
//  RxSwift_OrderFood
//
//  Created by SeungYeon Yoo on 2023/02/14.
//

import UIKit
import RxSwift
import RxCocoa

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!

    let disposeBag = DisposeBag()
    let imageName: BehaviorRelay = BehaviorRelay<String>(value: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageName
            .map({
                name in
                UIImage.init(named: name) //imageName String "" 초기값을 UIImage형태로 변환 (map사용)
            })
            .bind(to: foodImageView
                .rx
                .image)
            .disposed(by: disposeBag)
        
    }
}
