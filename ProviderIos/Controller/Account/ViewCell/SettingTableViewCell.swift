//
//  SettingTableViewCell.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imvAva: UIImageView!
    
    @IBOutlet weak var imvAva2: UIImageView!
    
    @IBOutlet weak var imvAva3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imvAva.setRounded()
        imvAva2.setRounded()
        imvAva3.setRounded()
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
