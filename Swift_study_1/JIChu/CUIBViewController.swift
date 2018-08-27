//
//  CUIBViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

protocol changeLabelTextDelegate:NSObjectProtocol {
    func changeLabelText()
}

class CUIBViewController: UIViewController {
    
    weak var delegate:changeLabelTextDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.white
        
        self.navigationItem.title="首页"

        let backBtn = UIButton(frame: CGRect(x: -20, y: 0, width: 25, height: 25))
        backBtn.setImage(UIImage(named: "nav_back"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        backBtn.imageEdgeInsets=UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        let item = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItems = [item]
        
    }
    
    @objc func back(){

        self.delegate?.changeLabelText()
        NotificationCenter.default.post(name:NSNotification.Name("changelabeltext"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
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
