//
//  WBDemoViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "This is No. \(navigationController?.childViewControllers.count ?? 0)"
    }
    
    /// Action
    func barButtonPressed() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - setupUI
extension WBDemoViewController {
    
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "next", target: self, action: #selector(barButtonPressed))
    }
}
