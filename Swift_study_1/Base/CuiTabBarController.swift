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
        self.viewControllers=[firstNC,secondNC,thirdNC]
        
        let firstItem = UITabBarItem(title: "基础", image: UIImage(named: "tab_0"), selectedImage: UIImage(named: "tab_selected_0"))
        let secondItem = UITabBarItem(title: "UI", image: UIImage(named: "tab_1"), selectedImage: UIImage(named: "tab_selected_1"))
        let thirdItem = UITabBarItem(title: "网络", image: UIImage(named: "tab_2"), selectedImage: UIImage(named: "tab_selected_2"))
        
        firstNC.tabBarItem=firstItem
        secondNC.tabBarItem=secondItem
        thirdNC.tabBarItem=thirdItem
        
        self.tabBar.isTranslucent=false //设置是否透明--这里的透明不是全透明，设置背景色会有模糊效果
        self.tabBar.barTintColor=UIColor.white //设置背景色
        self.tabBar.tintColor=mainColor //设置选中的颜色
        //self.tabBar.clipsToBounds=true //去掉系统的分割线

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
