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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         getFriends()
      
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
