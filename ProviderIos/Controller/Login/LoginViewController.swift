//
//  LoginViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    
    var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func getData(){
      
        
    }
    
    func resultRequest(){
        
    }

    @IBAction func loginAction(_ sender: Any) {
        showDialog()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard case self = self else {
                return
            }
            self.dismissDialog()
            self.goToMainPage()
        }
    }
    
    func goToMainPage(){
        let storyboard = UIStoryboard(name: "ProviderApp", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//        navigationController?.pushViewController(controller, animated: true)
        present(controller, animated: true, completion: nil)
    }
    
}
