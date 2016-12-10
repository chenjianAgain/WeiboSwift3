//
//  WBBaseViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

/// The base controller of all controllers
class WBBaseViewController: UIViewController {
    
    /// Add a tableView
    var tableView: UITableView?
    
    /// Custom navigationBar
    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    /// Custom navigationItem
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    /// SetupUI
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    /// Model -> UI
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    /// Load data - up to subclass to implement
    func loadData() { }
}

// MARK: - Setup UI
extension WBBaseViewController {
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
        setupTableView()
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    /// Set up table view
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: self.tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    
    /// Set up navigation bar
    func setupNavigationBar() {
        // Add custom navigationBar
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WBBaseViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
