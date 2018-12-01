//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by 戴林 on 11/29/18.
//  Copyright © 2018 potatosoft.co.ltd. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
