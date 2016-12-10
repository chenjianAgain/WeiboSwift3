//
//  WBNavigationController.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/9.
//  Copyright © 2016年 chenjian. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = childViewControllers.count > 0
        
        if let vc = viewController as? WBBaseViewController {
            if childViewControllers.count > 1 {
                vc.navItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.rewind, target: self, action: #selector(popToParent))
            } else if childViewControllers.count == 1 {
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: childViewControllers.first!.title!, target: self, action: #selector(popToParent))
            }
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func popToParent() {
        popViewController(animated: true)
    }

}
