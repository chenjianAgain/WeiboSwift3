//
//  WBMainViewController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    // MARK: - System method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeButton()
    }
    
    
    /// 使用代码控制屏幕方向
    /// 单独处理横屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    
    /// Action
    ///
    /// - Parameter btn: compose button in the middle
    func compseBtnClick(btn: UIButton)
    {
        print(btn)
    }
    
    /// UI Component
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
}

// MARK: - 设置界面
extension WBMainViewController {
    
    /// 设置compose按钮
    func setupComposeButton() {
        tabBar.addSubview(composeButton)
        composeButton.center.x = tabBar.center.x
        composeButton.addTarget(self, action: #selector(compseBtnClick), for: UIControlEvents.touchUpInside)
    }
    
    /// 设置全部子控制器
    func setupAllChildViewControllers() {
        let array = [["clsName": "WBHomeViewController", "title": "home", "imageName": "tabbar_home"],
                     ["clsName": "WBMessageViewController", "title": "message", "imageName": "tabbar_message_center"],
                     ["": ""],
                     ["clsName": "WBDiscoverViewController", "title": "discover", "imageName": "tabbar_discover"],
                     ["clsName": "WBProfileViewController", "title": "profile", "imageName": "tabbar_profile"]]
        
        for dict in array {
            // 将单个nav套住的contentViewController 加入当前的tabbarController
            addChildViewController(controller(dict:dict))
        }
    }
    
    /// 使用字典创建一个子控制器，并套上nav
    ///
    /// dict: clsName, title, imageName
    ///
    private func controller(dict: [String: String]) -> UIViewController {
        
        // 1. Get the content of dict
        guard let clsName = dict["clsName"], let title = dict["title"], let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else { return UIViewController() }
        // 2. init the contentViewController, 反射
        let contentViewController = cls.init()
        print(contentViewController)
        // 3. set the  title
        contentViewController.title = title
        // 4. set the tabBarItem
        contentViewController.tabBarItem.image = UIImage(named: imageName)
        contentViewController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        contentViewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
        contentViewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], for: .normal)
        // 5. wrap with the nav
        let nav = WBNavigationController()
        nav.addChildViewController(contentViewController)
        
        return nav
    }
}
