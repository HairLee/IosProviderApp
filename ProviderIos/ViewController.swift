//
//  ViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       goToLoginPage()
    }

    func goToLoginPage(){
        let loginVc = LoginViewController()
        navigationController?.present(loginVc, animated: true, completion: nil)
    }


}

