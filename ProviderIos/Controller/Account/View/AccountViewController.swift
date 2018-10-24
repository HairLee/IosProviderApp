//
//  AccountViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.dataSource = self
        tableView.delegate = self
        
        tableView?.register(ProfileImageTableViewCell.nib, forCellReuseIdentifier: ProfileImageTableViewCell.identifier)
        
         tableView?.register(SocialNetworkTableViewCell.nib, forCellReuseIdentifier: SocialNetworkTableViewCell.identifier)
        
         tableView?.register(SettingTableViewCell.nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
       
    }
    
    func setBgColor() {
//        self.view.gradientLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
    }



}

extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier, for: indexPath)
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier, for: indexPath) as? ProfileImageTableViewCell {
                return cell
            }
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SocialNetworkTableViewCell.identifier, for: indexPath) as? SocialNetworkTableViewCell {
                return cell
            }
            
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell {
                return cell
            }
        
        default:
             return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
     
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Ambition \(indexPath.row)")
        let detailVc = AccountDetailViewController()
        navigationController?.pushViewController(detailVc, animated: true)
    }
}
