//
//  MyCollectionViewController.swift
//  DynamicTableView
//
//  Created by SeungYeon Yoo on 2023/02/09.
//

import UIKit

class MyCollectionViewController: UIViewController {
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    fileprivate let systemImageNameArray = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        print("MyCollectionVC - onCollectionViewTypeChanged called / sender: \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        case 1:
            myCollectionView.collectionViewLayout = createCompositionalLayoutForSecond()
        case 2:
            myCollectionView.collectionViewLayout = createCompositionalLayoutForThird()
        default:
            break
        }
    }
}


//데이터와 관련
extension MyCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = String(describing: MyCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        
        cell.imageName = systemImageNameArray[indexPath.item]
        
        //collectionview collectionViewLayout 설정
        myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        return cell
    }

}

//MARK: - collectionview compositional layout 관련
//아이템 -> 그룹 -> 섹션 만든다
extension MyCollectionViewController {
    //compositional layout 설정
    fileprivate func createCompositionalLayoutForFirst() -> UICollectionViewLayout {
        //compositional layout 생성
        let layout = UICollectionViewCompositionalLayout {
            //만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃을 반환해야 함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute: 고정값, estimated 추측, fraction 퍼센트 (스크린 사이즈의 1/3으로 하겠다, 1.0으로 하면 100%)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            //변경할부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //count 변경
            //그룹사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            //만든 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
        //compositional layout 생성
        let layout = UICollectionViewCompositionalLayout {
            //만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃을 반환해야 함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute: 고정값, estimated 추측, fraction 퍼센트 (스크린 사이즈의 1/3으로 하겠다, 1.0으로 하면 100%)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            //변경할부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/2)
            
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //count 변경
            //그룹사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            //만든 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
        //compositional layout 생성
        let layout = UICollectionViewCompositionalLayout {
            //만들게 되면 튜플 (키: 값, 키: 값)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 컬렉션 레이아웃을 반환해야 함.
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //item에 대한 사이즈 - absolute: 고정값, estimated 추측, fraction 퍼센트 (스크린 사이즈의 1/3으로 하겠다, 1.0으로 하면 100%)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            //변경할부분
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //count 변경
            //그룹사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            
            //만든 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
}


//액션과 관련
extension MyCollectionViewController: UICollectionViewDelegate {
    
}
