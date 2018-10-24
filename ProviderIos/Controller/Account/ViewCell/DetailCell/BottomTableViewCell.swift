//
//  BottomTableViewCell.swift
//  Ambition
//
//  Created by Fullname on 10/17/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit

class BottomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbName: UILabel!
    var item: String? {
        didSet {
            lbName.text = item
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
