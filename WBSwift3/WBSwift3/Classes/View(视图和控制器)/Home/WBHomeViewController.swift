//
//  WBHomeViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {
    /// Action
    func showFriends() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - setupUI
extension WBHomeViewController {
    /// setupUI
    override func setupUI() {
        super.setupUI()
        super.navItem.leftBarButtonItem = UIBarButtonItem(title: "friend", target: self, action: #selector(showFriends))
    }
}
