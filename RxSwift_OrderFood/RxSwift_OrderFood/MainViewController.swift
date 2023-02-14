//
//  MainViewController.swift
//  RxSwift_OrderFood
//
//  Created by SeungYeon Yoo on 2023/02/14.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    //원래 tableViewItems = 배열인데 이거를 Observable 시퀀스로 아래와 같이 변환
    //just: Observable이 4개의 요소만 방출한다는 것을 의미
    let tableViewItems = BehaviorRelay.init(value: [Food.init(name: "Hamburger", image: "hamburger"),
                                          Food.init(name: "Pizza", image: "pizza"),
                                          Food.init(name: "Salmon", image: "salmon"),
                                          Food.init(name: "Spaghetti", image: "spaghetti"),
                                          Food.init(name: "Club-sandwich", image: "club-sandwich"),
                                          Food.init(name: "Curry", image: "curry"),
                                          Food.init(name: "Cake", image: "cake"),
                                          Food.init(name: "Cheese", image: "cheese")])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        title = "Menu"
        
        //text: RxCocoa에서 제공하는 관찰 가능한 속성. 서치바가 비어있는 경우에도 여전히 모든 푸드 메뉴 표시하고 싶기 때문에 orEmpty를 써줌
        let foodQuery = searchBar.rx.text.orEmpty
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance) //사용자가 마음 바꿔서 빠르게 지울 수 있음
            .distinctUntilChanged() //같은 값 안 나오게
            .map({
                query in
                self.tableViewItems.value.filter({
                    food in
                    query.isEmpty || food.name.lowercased().contains(query.lowercased())
                })
            })
            .bind(to: tableView
                .rx
                .items(cellIdentifier: "myCell", cellType: FoodTableViewCell.self)) {
                    (tv, tableViewItems, cell) in
                    cell.foodLabel.text = tableViewItems.name
                    cell.foodImageView.image = UIImage.init(named: tableViewItems.image)
                }
                .disposed(by: disposeBag)
        
        tableView
            .rx.modelSelected(Food.self) //Observable
            .subscribe(onNext: {
                foodObject in
                let foodVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailViewController") as! FoodDetailViewController
                foodVC.imageName.accept(foodObject.image)
                self.navigationController?.pushViewController(foodVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        /*
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: {
                indexPath in
                
            })
            .disposed(by: disposeBag)
         */
    }
    
}

