//
//  HomeViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import Alamofire
class HomeViewController: BaseViewController {

    
    var appServerClient =  AppServerClient()

    var searchController = UISearchController(searchResultsController: nil)
    var candies = [
    Candy(category:"Chocolate", name:"Chocolate Bar"),
    Candy(category:"Chocolate", name:"Chocolate Chip"),
    Candy(category:"Chocolate", name:"Dark Chocolate"),
    Candy(category:"Hard", name:"Lollipop"),
    Candy(category:"Hard", name:"Candy Cane"),
    Candy(category:"Hard", name:"Jaw Breaker"),
    Candy(category:"Other", name:"Caramel"),
    Candy(category:"Other", name:"Sour Chew"),
    Candy(category:"Other", name:"Gummi Bear"),
    Candy(category:"Other", name:"Candy Floss"),
    Candy(category:"Chocolate", name:"Chocolate Coin"),
    Candy(category:"Chocolate", name:"Chocolate Egg"),
    Candy(category:"Other", name:"Jelly Beans"),
    Candy(category:"Other", name:"Liquorice"),
    Candy(category:"Hard", name:"Toffee Apple")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         getFriends()
        searchController.searchResultsUpdater = self
        if #available(iOS 9.1, *) {
            searchController.obscuresBackgroundDuringPresentation = false
        } else {
            // Fallback on earlier versions
        }
        searchController.searchBar.placeholder = "Search Candies"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
      
    }
    
    func getFriends() {
        showDialog()
        appServerClient.getFriends(completion: { [weak self] result in
            self?.dismissDialog()
            switch result {
            case .success(let friends):
                print(friends)
            case .failure( _):
                print("Can not get data")
                break
                
            }
        })
    }
    
    
}

extension HomeViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}
