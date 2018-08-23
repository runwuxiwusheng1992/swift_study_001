//
//  CUIAViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class CUIAViewController: UIViewController ,UIActionSheetDelegate,UIAlertViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        //导航标题
        self.navigationItem.title="Swift基础"
        self.navigationController?.navigationBar.barTintColor=mainColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20)]
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=UIColor.white
  
        //滚动视图
        let scrollBgview=UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-BottomHeight-NavHeight))
        scrollBgview.contentSize=CGSize(width: kScreenWidth, height: 650)
        self.view.addSubview(scrollBgview)
        
        //标签
        let orangeLabel = UILabel.init(frame: CGRect(x: 10, y: 10, width: kScreenWidth-20, height: 100))
        orangeLabel.backgroundColor = mainColor
        orangeLabel.text="this is a orange label"
        orangeLabel.textColor=UIColor.white
        orangeLabel.textAlignment=NSTextAlignment.center
        orangeLabel.font=UIFont.systemFont(ofSize: 25)
        scrollBgview.addSubview(orangeLabel)
        
        //按钮
        let redButton = UIButton.init(frame: CGRect(x: 10, y: 120, width: kScreenWidth-20, height: 100))
        redButton.backgroundColor=mainColor
        redButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        redButton.setTitle("I am a Button , click Me !", for: UIControlState.normal)
        redButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 30)
        redButton.addTarget(self, action:#selector(redButtonClick), for: UIControlEvents.touchUpInside)
        scrollBgview.addSubview(redButton)
        
        //imageview
        let greenImageview=UIImageView(image: UIImage(named: "skyImage"))
        greenImageview.frame=CGRect(x: 10, y: 230, width: kScreenWidth-20, height: 100)
        greenImageview.backgroundColor=UIColor.black
        greenImageview.layer.borderWidth=1;
        greenImageview.layer.borderColor=mainColor.cgColor
        greenImageview.layer.cornerRadius=5;
        greenImageview.isUserInteractionEnabled=true
        scrollBgview.addSubview(greenImageview)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        greenImageview.addGestureRecognizer(tap)
        
        //开关
        let switchview=UISwitch(frame: CGRect(x: 10, y: 340, width: 120, height: 50))
        switchview.addTarget(self, action: #selector(switchChange(_:)), for: .valueChanged)
        switchview.thumbTintColor=mainColor
        switchview.tintColor=mainColor
        switchview.onTintColor=UIColor.red
        scrollBgview.addSubview(switchview)
        
        //活动指示器
        let activity = UIActivityIndicatorView(frame: CGRect(x: 150, y: 340, width: 50, height: 50))
        activity.backgroundColor=mainColor
        activity.color=UIColor.red
        activity.tag=20
        activity.startAnimating()
        scrollBgview.addSubview(activity)
        
        //滑动条
        let slideview=UISlider(frame: CGRect(x: 10, y: 400, width: kScreenWidth-20, height: 50))
        slideview.value=50
        slideview.minimumValue=0
        slideview.maximumValue=255
        slideview.isContinuous=true
        slideview.maximumTrackTintColor=UIColor.orange
        slideview.minimumTrackTintColor=mainColor
        slideview.thumbTintColor=mainColor
        slideview.addTarget(self, action:  #selector(slideChange(_:)), for: .valueChanged)
        scrollBgview.addSubview(slideview)
        
        //分段控制器
        let segmentview=UISegmentedControl(frame: CGRect(x: 10, y: 460, width: kScreenWidth-20, height: 30))
        segmentview.tintColor=mainColor
        segmentview.insertSegment(withTitle: "左", at: 0, animated: true)
        segmentview.insertSegment(withTitle: "中", at: 1, animated: true)
        segmentview.insertSegment(withTitle: "右", at: 2, animated: true)
        segmentview.selectedSegmentIndex=1
        segmentview.addTarget(self, action: #selector(segmentChange(_:)), for: UIControlEvents.valueChanged)
        scrollBgview.addSubview(segmentview)
        
        
        //步进器
        let stepper = UIStepper.init(frame: CGRect(x: 10, y: 520, width: 100, height: 30))
        stepper.value=1
        stepper.maximumValue=10
        stepper.minimumValue=1
        stepper.tintColor=mainColor
        stepper.addTarget(self, action: #selector(stepperChange(_:)), for: .valueChanged)
        scrollBgview.addSubview(stepper)
        
        let stepperLabel=UILabel(frame: CGRect(x: 10+100+10, y: 520, width: kScreenWidth-20-100-10, height: 30))
        stepperLabel.font=UIFont.systemFont(ofSize: 16);
        stepperLabel.backgroundColor=mainColor
        stepperLabel.textColor=UIColor.white
        stepperLabel.tag=10
        stepperLabel.text="步进器的值为0.0"
        stepperLabel.textAlignment=NSTextAlignment.center
        scrollBgview.addSubview(stepperLabel)
        
        //进度条
        let progressView=UIProgressView(frame: CGRect(x: 10, y: 580, width: kScreenWidth-20, height: 20))
        progressView.progress=0.5
        progressView.tintColor=mainColor
        progressView.trackTintColor=UIColor.red
        scrollBgview.addSubview(progressView)
        
    }
    
    //分段控制器的事件
    @objc func segmentChange(_ segmentview: UISegmentedControl) {
        print("选中了\(segmentview.selectedSegmentIndex)")
    }
    
    //滑块儿的事件
    @objc func slideChange(_ slide: UISlider) {
        self.view.backgroundColor=UIColor(red: CGFloat(slide.value/255.0), green: 100/255, blue: 50/255, alpha: 1)
    }
    
    //开关按钮的点击事件
    @objc func switchChange(_ switchview: UISwitch) {
        let activity=self.view.viewWithTag(20) as! UIActivityIndicatorView
        switch(switchview.isOn) {
        case true:
            self.view.backgroundColor=UIColor.black
            activity.stopAnimating()
        default:
            self.view.backgroundColor=UIColor.white
            activity.startAnimating()
        }
    }

    //步进器的事件
    @objc func stepperChange(_ stepper: UIStepper) {
        let stepperLabel=self.view.viewWithTag(10) as! UILabel
        stepperLabel.text="步进值为\(stepper.value)"
    }
    
    //按钮的点击事件
    @objc func redButtonClick(){
        let actionSheet = UIActionSheet(title: "请选择", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "第1条数据", "第2条数据","第3条数据")
        actionSheet.show(in: self.view)
    }
    
    @objc func tapClick(){
        let alertview=UIAlertView(title: "温馨提示", message: "您点击了一张图片", delegate: self, cancelButtonTitle: "知道了")
        alertview.show()
    }
    
    //sctionsheet--delegate
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        switch buttonIndex {
        case 0,1,2,3:
            print("选择了\(buttonIndex)")
        default:
            print("选择了其他")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
