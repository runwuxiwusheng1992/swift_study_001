//
//  CuiTabBarController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class CuiTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstNC=UINavigationController.init(rootViewController: CUIAViewController())
        let secondNC=UINavigationController.init(rootViewController: CUIDViewController())
        let thirdNC=UINavigationController.init(rootViewController: CUIHViewController())
        firstNC.title="基础"
        secondNC.title="UI"
        thirdNC.title="网络"
        self.addChildViewController(firstNC)
        self.addChildViewController(secondNC)
        self.addChildViewController(thirdNC)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
