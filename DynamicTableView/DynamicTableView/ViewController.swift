//
//  ViewController.swift
//  DynamicTableView
//
//  Created by SeungYeon Yoo on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    let contentArray = ["길을 잃었다, 어딜 가야 할까 열두 개로 갈린 조각난 골목길 어딜 가면 너를 다시 만날까 운명으로 친다면, 내 운명을 고르자면 눈을 감고 걸어도 맞는 길을 고르지 사라져버린 Summer Time",
    "당신에게 드릴 게 없어서 나의 마음을 드려요 그대에게 받은 게 많아서 표현을 다 할 수가 없어요 나지막한 인사에 수많은 내 마음 고이 담아 그대에게로 건네면",
    "생각이 많은 건 말이야 당연히 해야 할 일이야",
    "몰랐었어 너의 그바램들을 모두 이해한다 믿고만 싶었던거야 너무 힘들다고 말하는 널 보며잠시 헤어지자고 말을 했던 나였어",
    "I'm standing on the edge 난 가장 높은 곳에서 Everything is upside down 두렵지 않아 break it down"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("contentArray.count: \(contentArray.count)")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.descriptionLabel.text = contentArray[indexPath.row]
        return cell
    }
}
