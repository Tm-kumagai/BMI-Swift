//
//  TabBarControllerViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/03/11.
//  Copyright © 2020 cries. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // アイコンの色
//        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 233/255, blue: 51/255, alpha: 1.0) // yellow
        
        // 背景色
//        UITabBar.appearance().barTintColor = UIColor(red: 66/255, green: 74/255, blue: 93/255, alpha: 1.0) // grey black
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is TabBarDelegate {
            let v = viewController as! TabBarDelegate
            v.didSelectTab(tabBarController: self)
        }
    }
}
