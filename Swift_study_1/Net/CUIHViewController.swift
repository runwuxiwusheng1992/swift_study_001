//
//  CUIHViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit
import Alamofire
class CUIHViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Swift-网络"
        self.view.backgroundColor=UIColor.white
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request)  // 原始的URL请求
//            print(response.response) // HTTP URL响应
//            print(response.data)     // 服务器返回的数据
 //           print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
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
