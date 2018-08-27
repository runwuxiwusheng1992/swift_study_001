//
//  CUIDViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class CUIDViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    lazy var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavHeight-BottomHeight))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets=false
        
        self.navigationItem.title="Swift-UI"
        self.navigationController?.navigationBar.barTintColor=mainColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20)]
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=UIColor.white
        
        self.tableView.delegate=self
        self.tableView.dataSource=self
        self.view.addSubview(self.tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
