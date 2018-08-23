//
//  CUIAViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class CUIAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="Swift基础"
        self.view.backgroundColor=UIColor.white
        let orangeLabel = UILabel.init(frame: CGRect(x: 10, y: 64, width: 355, height: 100))
        orangeLabel.backgroundColor = UIColor.orange
        orangeLabel.text="this is a orange label"
        orangeLabel.textColor=UIColor.black
        orangeLabel.textAlignment=NSTextAlignment.center
        orangeLabel.font=UIFont.systemFont(ofSize: 25)
        self.view.addSubview(orangeLabel)
        
        let redButton = UIButton.init(frame: CGRect(x: 10, y: 174, width: 355, height: 100))
        redButton.backgroundColor=UIColor.red
        redButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        redButton.setTitle("red Button", for: UIControlState.normal)
        redButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 30)
        redButton.addTarget(self, action:#selector(redButtonClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(redButton)
        
        
    }
    
    @objc func redButtonClick(){
        print("redButtonClick")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
