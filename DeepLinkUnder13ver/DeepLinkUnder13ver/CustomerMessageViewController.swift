//
//  CustomerMessageViewController.swift
//  DeepLinkUnder13ver
//
//  Created by SeungYeon Yoo on 2023/04/15.
//

import UIKit

class CustomerMessageViewController: UIViewController {

    @IBOutlet weak var customerIdLabel: UILabel!
    
    var customerId: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customerIdLabel.text = customerId

    }


}
