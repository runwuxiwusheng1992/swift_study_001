//
//  CUIDViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit
import ESPullToRefresh

class CUIDViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    lazy var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavHeight-BottomHeight))
    var dataSourceArr = ["NVActivityIndicatorView  漂亮的加载指示器"]
    
    
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
        
        self.tableView.es.addPullToRefresh {
            [weak self] in
            /// 在这里做刷新相关事件
            
            /// ...
            self?.tableView.es.stopPullToRefresh(ignoreDate: true)
            self?.tableView.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
        
        self.tableView.es.addInfiniteScrolling {
            [weak self] in
            /// 在这里做加载更多相关事件
            /// ...
            /// 如果你的加载更多事件成功，调用es_stopLoadingMore()重置footer状态
            self?.tableView.es.stopLoadingMore()
            /// 通过es_noticeNoMoreData()设置footer暂无数据状态
            self?.tableView.es.noticeNoMoreData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=self.dataSourceArr[indexPath.row]
        cell.selectionStyle=UITableViewCellSelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let NVActivityViewVC = NVActivityIndicatorViewVC()
            NVActivityViewVC.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(NVActivityViewVC, animated: true)
        default:
            return ;
        }
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
