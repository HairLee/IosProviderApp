//
//  AccountDetailViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/24/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = SecondViewModel()
    var heardearView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heardearView = UIView()
        heardearView.backgroundColor = UIColor.red
        self.view.addSubview(heardearView)
        
        tableView?.dataSource = viewModel
        tableView?.estimatedRowHeight = 150
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.register(TopTableViewCell.nib, forCellReuseIdentifier: TopTableViewCell.identifier)
        tableView?.register(MidTableViewCell.nib, forCellReuseIdentifier: MidTableViewCell.identifier)
        tableView?.register(BottomTableViewCell.nib, forCellReuseIdentifier: BottomTableViewCell.identifier)
    }


}
