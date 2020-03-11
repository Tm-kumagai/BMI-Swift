//
//  TabBarDelegate.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/03/11.
//  Copyright © 2020 cries. All rights reserved.
//

import Foundation

@objc protocol TabBarDelegate {
    
    func didSelectTab(tabBarController: TabBarController)
}
