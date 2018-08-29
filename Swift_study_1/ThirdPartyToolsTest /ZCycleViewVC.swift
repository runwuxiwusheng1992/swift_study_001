//
//  ZCycleViewVC.swift
//  Swift_study_1
//
//  Created by 好价 on 2018/8/29.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class ZCycleViewVC: UIViewController,ZCycleViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.white
        
        self.navigationItem.title="轮播图"
        let backBtn = UIButton(frame: CGRect(x: -20, y: 0, width: 25, height: 25))
        backBtn.setImage(UIImage(named: "nav_back"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        backBtn.imageEdgeInsets=UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        let item = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItems = [item]
        
        let scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-NavHeight))
        scrollview.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight*1.5)
        self.view.addSubview(scrollview)
        
        //上下滚动
        let cycleView1 = ZCycleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 100))
        cycleView1.setUrlsGroup(["http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171101181927887.jpg", "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171114171645011.jpg", "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171114172009707.png"])
        cycleView1.pageControlIndictirColor = mainColor
        cycleView1.pageControlCurrentIndictirColor = UIColor.white
        cycleView1.scrollDirection = .vertical
        cycleView1.delegate = self
        scrollview.addSubview(cycleView1)
        
        //图片左右滚动
        let cycleView2 = ZCycleView(frame: CGRect(x: 0, y: 100, width: kScreenWidth, height: 150))
        cycleView2.timeInterval = 3
        cycleView2.backgroundColor=mainColor
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            cycleView2.setUrlsGroup(["http://t.cn/RYMuvvn","http://t.cn/RYVfnEO","http://t.cn/RYVf1fd","http://t.cn/RYVfgeI","http://t.cn/RYVfsLo"])
            cycleView2.pageControlIsHidden = false
        }
        cycleView2.pageControlItemSize = CGSize(width: 16, height: 4)
        cycleView2.pageControlCurrentItemSize = CGSize(width: 10, height: 10)
        cycleView2.pageControlIndictirColor = UIColor.white
        cycleView2.pageControlCurrentIndictirColor = UIColor.blue
        cycleView2.pageControlHeight = (cycleView2.frame.size.height-90*1.3)/2
        cycleView2.itemSize = CGSize(width: 240, height: 90)
        cycleView2.itemZoomScale = 1.2
        
        cycleView2.didSelectedItem = {
            print("cycleView2 didSelectedItem:  \($0)")
        }
        scrollview.addSubview(cycleView2)
        
        //文字上下滚动
        let cycleView3 = ZCycleView(frame: CGRect(x: 0, y: 250, width: kScreenWidth, height: 50))
        cycleView3.setTitlesGroup(["更多title/item/pageControl使用方式，请参考API","GitHub: https://github.com/MQZHot/ZCycleView","如有问题，欢迎issue，联系QQ：735481274","或者联系邮箱 ---- mqz1228@163.com", "欢迎star✨✨✨✨✨✨，谢谢支持"])
        cycleView3.setTitleImagesGroup([#imageLiteral(resourceName: "tab_selected_2"),#imageLiteral(resourceName: "tab_selected_2"),#imageLiteral(resourceName: "tab_selected_2")], sizeGroup: [CGSize(width: 30, height: 15),CGSize(width: 30, height: 15),CGSize(width: 30, height: 15)])
        cycleView3.titleBackgroundColor = UIColor.white
        cycleView3.titleColor = UIColor.blue
        cycleView3.scrollDirection = .vertical
        cycleView3.didSelectedItem = {
            print("cycleView3 didSelectedItem:  \($0)")
        }
        scrollview.addSubview(cycleView3)
        
        //
        let cycleView4 = ZCycleView(frame: CGRect(x: 0, y: 300, width: kScreenWidth, height: (kScreenWidth-160)*300/750))
        cycleView4.setImagesGroup([#imageLiteral(resourceName: "lunbo4"),#imageLiteral(resourceName: "lunbo3"),#imageLiteral(resourceName: "lunbo2"),#imageLiteral(resourceName: "lunbo1")], titlesGroup: ["天天特价 -- 超值量贩，底价疯抢天天特价","一缕情丝，一缕温暖","快速匹配，及时推送","气质春装，一件包邮"])
        cycleView4.itemSize = CGSize(width: kScreenWidth-160, height: (kScreenWidth-160)*300/750)
        cycleView4.itemSpacing = 40
        cycleView4.itemZoomScale = 1.2
        cycleView4.itemBorderWidth = 1
        cycleView4.itemBorderColor = UIColor.gray
        cycleView4.pageControlIndictorImage = #imageLiteral(resourceName: "tab_2")
        cycleView4.pageControlCurrentIndictorImage = #imageLiteral(resourceName: "tab_selected_2")
        cycleView4.pageControlHeight = 18
        cycleView4.pageControlItemSize = CGSize(width: 16, height: 16)
        cycleView4.pageControlAlignment = .right
        cycleView4.didSelectedItem = {
            print("cycleView4 didSelectedItem:  \($0)")
        }
        scrollview.addSubview(cycleView4)
        
        //
        
        let cycleView5 = ZCycleView(frame: CGRect(x: 0, y: 300+(kScreenWidth-160)*300/750+20, width: kScreenWidth, height: 150))
        let titles: [NSString] = ["正在直播·2017维密直播大秀\n天使惊艳合体性感开撩","猎场-会员抢先看\n胡歌陈龙联手戳穿袁总阴谋","我的！体育老师\n好样的！前妻献媚讨好 张嘉译一口回绝","小宝带你模拟断案！\n开局平民，晋升全靠运筹帷幄","【挑战极限·精华版】孙红雷咆哮洗车被冻傻"]
        
        let attibutedTitles = titles.map { (str) -> NSAttributedString in
            let arr = str.components(separatedBy: "\n")
            let attriStr = NSMutableAttributedString(string:str as String)
            attriStr.addAttributes([.foregroundColor: UIColor.green, .font: UIFont.systemFont(ofSize: 13)], range: NSMakeRange(0, arr[0].count))
            if arr.count > 1 {
                attriStr.addAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 11)], range: NSMakeRange(arr[0].count+1, arr[1].count))
            }
            return attriStr
        }
        
        cycleView5.timeInterval = 3
        cycleView5.setImagesGroup([#imageLiteral(resourceName: "lunbo1"),#imageLiteral(resourceName: "lunbo2"),#imageLiteral(resourceName: "lunbo3"),#imageLiteral(resourceName: "lunbo4"),#imageLiteral(resourceName: "lunbo1")], attributedTitlesGroup: attibutedTitles)
        cycleView5.itemSize = CGSize(width: kScreenWidth-40, height: (kScreenWidth-40)*30/70)
        cycleView5.itemSpacing = 5
        cycleView5.titleBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        cycleView5.titleNumberOfLines = 0
        cycleView5.titleViewHeight = 40
        scrollview.addSubview(cycleView5)
        
        let cycleView6 = ZCycleView(frame: CGRect(x: 0, y: 300+(kScreenWidth-160)*300/750+20+150, width: kScreenWidth, height: 150))
        cycleView6.placeholderImage = #imageLiteral(resourceName: "skyImage")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            cycleView6.setUrlsGroup(["http://t.cn/RYVfQep",
                                     "http://t.cn/RYVfgeI",
                                     "http://t.cn/RYVfsLo",
                                     "http://t.cn/RYMuvvn",
                                     "http://t.cn/RYVfnEO",
                                     "http://t.cn/RYVf1fd"])
        }
        
        cycleView6.pageControlItemSize = CGSize(width: 16, height: 4)
        cycleView6.pageControlItemRadius = 0
        cycleView6.pageControlAlignment = .right
        scrollview.addSubview(cycleView6)
        
        let cycleView7 = ZCycleView(frame: CGRect(x: 0, y: 300+(kScreenWidth-160)*300/750+20+150+150+10, width: kScreenWidth, height: 150))
        cycleView7.setUrlsGroup(["http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171101181927887.jpg", "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171114171645011.jpg", "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171114172009707.png"])
        cycleView7.timeInterval = 3
        scrollview.addSubview(cycleView7)
        
    }
    
    func cycleViewDidScrollToIndex(_ index: Int) {
        print(index)
    }
    func cycleViewDidSelectedIndex(_ index: Int) {
        print("selected: \(index)")
    }
    @objc func back(){
        
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
