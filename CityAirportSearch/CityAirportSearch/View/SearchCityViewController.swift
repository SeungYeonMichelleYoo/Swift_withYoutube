//
//  SearchCityViewController.swift
//  CityAirportSearch
//
//  Created by SeungYeon Yoo on 2023/09/09.
//

import UIKit
import RxSwift
import RxDataSources

class SearchCityViewController: UIViewController {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SearchCityViewPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


}

