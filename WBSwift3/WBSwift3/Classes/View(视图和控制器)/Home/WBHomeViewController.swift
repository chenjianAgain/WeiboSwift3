//
//  WBHomeViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {
    
    lazy var statusList = [String]()
    
    /// Action
    func showFriends() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// override the method of super class
    override func loadData() {
        for i in 0 ..< 15 {
            statusList.insert(i.description, at: 0)
        }
    }
}


// MARK: - Table view source
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
}

// MARK: - setupUI
extension WBHomeViewController {
    /// setupUI
    override func setupUI() {
        super.setupUI()
        super.navItem.leftBarButtonItem = UIBarButtonItem(title: "friend", target: self, action: #selector(showFriends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}


