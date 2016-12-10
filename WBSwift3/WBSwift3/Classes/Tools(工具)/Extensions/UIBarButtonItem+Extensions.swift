//
//  UIBarButtonItem+Extensions.swift
//  WBSwift3
//
//  Created by chenjian on 2016/12/10.
//  Copyright © 2016年 chenjian. All rights reserved.
//


import Foundation

extension UIBarButtonItem {
    
    convenience init(title: String, target: AnyObject?, action: Selector, isBack: Bool = true, fontSize: CGFloat = 18) {
        let button: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: .darkGray , highlightedColor: .orange)
        button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        self.init(customView: button)
    }
}
