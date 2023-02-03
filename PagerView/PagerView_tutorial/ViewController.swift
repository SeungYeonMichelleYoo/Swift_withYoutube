//
//  ViewController.swift
//  PagerView_tutorial
//
//  Created by SeungYeon Yoo on 2022/04/26.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    

    fileprivate let imageNames = ["1.png", "2.png", "3.png", "4.png"]
    
    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var myPagerView: FSPagerView!{
        didSet{
            // 페이저뷰에 쎌을 등록한다.
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            // 무한 스크롤 설정
            self.myPagerView.isInfinite = true
            // 자동 스크롤(4초에 한번씩 넘어감)
            self.myPagerView.automaticSlidingInterval = 4.0
        }
    }
    
    @IBOutlet weak var myPageControl: FSPageControl! {
        didSet{
            self.myPageControl.numberOfPages = self.imageNames.count
            self.myPageControl.contentHorizontalAlignment = .right
            self.myPageControl.itemSpacing = 16 //점과 점 사이의 간격
            self.myPageControl.interitemSpacing = 16
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myPagerView.dataSource = self
        self.myPagerView.delegate = self
        
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
        
    }
    
    //MARK: - IBActions
    @IBAction func onLeftBtnClicked(_ sender: UIButton) {
        print("ViewController - onLeftBtnClicked() called")
        
        self.myPageControl.currentPage = self.myPageControl.currentPage - 1
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
        
    }
    
    @IBAction func onRightBtnClicked(_ sender: UIButton) {
        print("ViewController - onRightBtnClicked() called")
        
        // 끝으로 가면 0 으로 초기화시켜줌 (배열식이라 오른쪽 버튼만 왼쪽버튼과 달리 초기화시키지 않으면 에러남) - 어렵다ㅠㅠ
        if(self.myPageControl.currentPage == self.imageNames.count - 1 ){
            myPageControl.currentPage = 0
        } else{
            // 일반적인 경우
            self.myPageControl.currentPage = self.myPageControl.currentPage + 1
        }
    
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    
    
    //MARK: - FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    // 각 셀에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit

           return cell
    }
    
    //MARK: - FSPagerView delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPageControl.currentPage = pagerView.currentIndex
    }
    
    // 이미지 클릭했을 때 뒤에 하이라이트(쉐도우 생기는거) 없앤다
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }

}

