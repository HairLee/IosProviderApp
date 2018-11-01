//
//  LoginViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    
    private let appServerClient =  AppServerClient()
    override func viewDidLoad() {
        super.viewDidLoad()
 
    
    }
    

    @IBAction func loginAction(_ sender: Any) {
  
            doLogin()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            guard case self = self else {
//                return
//            }
//            self.dismissDialog()
//            self.goToMainPage()
//        }
    }
    
    func goToMainPage(){
        let storyboard = UIStoryboard(name: "ProviderApp", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//        navigationController?.pushViewController(controller, animated: true)
        present(controller, animated: true, completion: nil)
    }
    
    func doLogin(){
              showDialog()
        appServerClient.postLogin(username: "admin", password: "pr0vid3rApp",type: "1") { [weak self] result in
            self?.dismissDialog()
            switch result {
            case .success:
                self?.goToMainPage()
                break

                
            case .failure(let error):
                print("DATA FAIL")
                self?.goToMainPage()
                break
              
                
            }
        }
    }
    
}
