//
//  WBBaseViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    /// Custom navigationBar
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    /// Custom navigationItem
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    /// SetupUI
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Model -> UI
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}

// MARK: - Setup UI
extension WBBaseViewController {
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        // Add custom navigationBar
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
    }
}
