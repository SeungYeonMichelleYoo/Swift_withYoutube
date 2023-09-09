//
//  SearchCityViewModel.swift
//  CityAirportSearch
//
//  Created by SeungYeon Yoo on 2023/09/09.
//

import RxCocoa

protocol SearchCityViewPresentable {
    //ViewController -> ViewModel
    typealias Input = (
        searchText: Driver<String>, ()
    )
    //ViewModel -> ViewController
    typealias Output = ()
    
    var input: SearchCityViewPresentable.Input { get }
    var output: SearchCityViewPresentable.Output { get }
}


class SearchCityViewModel: SearchCityViewPresentable {
    var input: SearchCityViewPresentable.Input
    var output: SearchCityViewPresentable.Output
    
    init(input: SearchCityViewPresentable.Input) {
        self.input = input
        self.output = SearchCityViewModel.output(input: self.input)
    }
}

private extension SearchCityViewModel {
    static func output(input: SearchCityViewPresentable.Input) -> SearchCityViewPresentable.Output {
        return ()
    }
}
