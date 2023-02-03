//
//  ViewController.swift
//  MyFirstiOS
//
//  Created by SeungYeon Yoo on 2022/04/21.
//

import UIKit

class ViewController: UIViewController { //UIViewController를 상속한다.
    
    // 제목
    var titleLabel: UILabel = { //변수 선언과 동시에 정의
       
        let label = UILabel() //인스턴스를 생성하는거
        label.text = "헬로우월드"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        view.addSubview(titleLabel) //view=전체 그림. addsubView:이름 집어 넣는다.
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true // X축 정 가운데 두겠다.
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }


}

