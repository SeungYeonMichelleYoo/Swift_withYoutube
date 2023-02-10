//
//  TableViewCell.swift
//  DynamicTableView
//
//  Created by SeungYeon Yoo on 2023/02/08.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //셀이 렌더링 될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        print("TableViewCell - awakeFromNib() called")
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
    }
    
}
