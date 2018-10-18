//
//  ProfileImageTableViewCell.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imvAva: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imvAva.setRounded()
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
