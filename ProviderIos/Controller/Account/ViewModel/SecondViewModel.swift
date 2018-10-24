//
//  SecondViewModel.swift
//  Ambition
//
//  Created by Fullname on 10/17/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

enum SecondViewModelItemType {
    case topCell
    case midCell
    case bottomCell
}

protocol SecondViewModelItem {
    var type: SecondViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

public func getDataFromServer()  {
    Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
        if((responseData.result.value) != nil) {
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            if let resData = swiftyJsonVar["contacts"].arrayObject {
                print(resData)
            }
            
        }
    }
}


class SecondViewModel: NSObject {
    
    var secondItems = [SecondViewModelItem]()
    
    override init() {
        super.init()
        
        getDataFromServer()
        
        let topItem = SecondViewModelTopItem(about: "Ahihi")
        secondItems.append(topItem)
        
        
        let midItem = SecondViewModelMidItem(about: "Ahihe")
        secondItems.append(midItem)
        
        let bottomItem = SecondViewModelBottomItem(friends: ["Ambition","Hair Lee","Ahihia","Ambition","Hair Lee","Ahihia","Ambition","Hair Lee","Ahihia","Ambition","Hair Lee","Ahihia","Ambition","Hair Lee","Ahihia","Ambition","Hair Lee","Ahihia"])
        secondItems.append(bottomItem)
        
    }
    
}

extension SecondViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return secondItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondItems[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = secondItems[indexPath.section]
        
        switch item.type {
        case .topCell:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.identifier, for: indexPath) as? TopTableViewCell {
                cell.item = item
                cell.tag = indexPath.section
                return cell
            }
            
        case .midCell:
            if let cell = tableView.dequeueReusableCell(withIdentifier: MidTableViewCell.identifier, for: indexPath) as? MidTableViewCell {
                cell.item = item
                return cell
            }
            
        case .bottomCell:
            if let item = item as? SecondViewModelBottomItem, let cell = tableView.dequeueReusableCell(withIdentifier: BottomTableViewCell.identifier, for: indexPath) as? BottomTableViewCell {
                let friend = item.friends[indexPath.row]
                cell.item = friend
                return cell
            }
            
        }
        
        return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secondItems[section].sectionTitle
    }
    
    
    
}

class SecondViewModelTopItem: SecondViewModelItem {
    
    var type: SecondViewModelItemType {
        return .topCell
    }
    
    var sectionTitle: String {
        return "About"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class SecondViewModelMidItem: SecondViewModelItem {
    
    var type: SecondViewModelItemType {
        return .midCell
    }
    
    var sectionTitle: String {
        return "Mid"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class SecondViewModelBottomItem: SecondViewModelItem {
    
    var type: SecondViewModelItemType {
        return .bottomCell
    }
    
    var sectionTitle: String {
        return "Bottom"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
    
    var friends: [String]
    
    init(friends: [String]) {
        self.friends = friends
    }
}





