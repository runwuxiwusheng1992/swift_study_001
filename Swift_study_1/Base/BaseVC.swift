//
//  BaseVC.swift
//  Swift_study_1
//
//  Created by 好价 on 2018/8/30.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        
        let backBtn = UIButton(frame: CGRect(x: -20, y: 0, width: 25, height: 25))
        backBtn.setImage(UIImage(named: "nav_back"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        backBtn.imageEdgeInsets=UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        let item = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItems = [item]
        
    }
    
    @objc func back(){
        
        self.navigationController?.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
