//
//  BaseViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import MRProgress
class BaseViewController: UIViewController {
    
    var overlay = MRProgressOverlayView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showDialog(){
        overlay = MRProgressOverlayView.showOverlayAdded(to: self.view, animated: true)
    }
    
    func dismissDialog(){
        overlay.dismiss(true)
    }

}
