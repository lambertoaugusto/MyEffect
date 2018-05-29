//
//  TabViewController.swift
//  MyEffect
//
//  Created by Patricia Freire Sestari on 22/05/18.
//  Copyright © 2018 MyEffect. All rights reserved.
//

import UIKit

import MaterialComponents

class TabViewController: UIViewController, MDCTabBarDelegate {
    
    override func viewDidLoad() {
        let tabBar = MDCTabBar(frame: view.bounds)
        tabBar.delegate = self
        tabBar.items = [
            UITabBarItem(title: "Actions", image: nil, tag: 0),
            UITabBarItem(title: "Groups", image: nil, tag: 1),
            UITabBarItem(title: "Challenges", image: nil, tag: 2)
        ]
        tabBar.itemAppearance = .titles
        tabBar.autoresizingMask = [.flexibleWidth]
        tabBar.alignment = MDCTabBarAlignment.center
        tabBar.displaysUppercaseTitles = false
        //tabBar.selectedItemTintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.sizeToFit()
        view.addSubview(tabBar)
        
        tabBar.selectedItemTintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.tintColor = UIColor(displayP3Red: 0, green: 184.0/255, blue: 241.0/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(displayP3Red: 3.0/255, green: 88.0/255, blue: 153.0/255, alpha: 1.0)
    }
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
    
}
