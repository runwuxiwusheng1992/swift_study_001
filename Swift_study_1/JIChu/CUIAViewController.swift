//
//  CUIAViewController.swift
//  Swift_1_UIlabel
//
//  Created by 好价 on 2018/8/22.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit
class CUIAViewController: UIViewController ,UIActionSheetDelegate,UIAlertViewDelegate,UITextFieldDelegate,changeLabelTextDelegate{

    var scrollBgview=UIScrollView()
    var textfield=UITextField()
    var contentoffset=CGPoint()
    var orangeLabel=UILabel()
    var bigBgBtn=UIButton(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航标题
        self.navigationItem.title="Swift基础"
        self.navigationController?.navigationBar.barTintColor=mainColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20)]
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=UIColor.white
  
        //滚动视图
        scrollBgview.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-BottomHeight-NavHeight)
        scrollBgview.contentSize=CGSize(width: kScreenWidth, height: 700)
        self.view.addSubview(scrollBgview)
        
        //标签
        orangeLabel = UILabel.init(frame: CGRect(x: 10, y: 10, width: kScreenWidth-20, height: 100))
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
        
        //文本框
        textfield = UITextField(frame: CGRect(x: 10, y: 620, width: kScreenWidth-20, height: 40))
        textfield.borderStyle=UITextBorderStyle.roundedRect
        textfield.delegate=self
        //设置textfield的leftview
        let textimage = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        textimage.image=UIImage(named: "sousuo")
        textfield.leftView=textimage
        //leftview与textfield边距不可调整，两种解决办法（1）美工切图留边 （2）leftview上加imageview设置imageview的边距
        textfield.leftViewMode = .always
        
        //Always 一直显示
        //Never 从不显示(默认)
        //WhileEditing 当文本输入框处于编辑状态的时候才显示
        //UnlessEditing 当文本输入框处于非编辑状态的时候才显示
        //注:当文本输入框中有光标的时候就是处于编辑状态
        textfield.clearButtonMode = .always
        textfield.attributedPlaceholder=NSAttributedString(string: "请输入您想输入的文字", attributes: [NSAttributedStringKey.foregroundColor:mainColor])
        scrollBgview.addSubview(textfield)
        
        self.view.addSubview(self.bigBgBtn)
        self.bigBgBtn.isHidden=true
        self.bigBgBtn.addTarget(self, action: #selector(bigBgBtnClick), for: UIControlEvents.touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabelbackground), name:NSNotification.Name("changelabeltext"), object: nil)
    }
    
    deinit {
        /// 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyBoardWillShow(_ notification: Notification){
        
        self.bigBgBtn.isHidden = false
        let kbInfo = notification.userInfo
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let changeY = kbRect.size.height
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double
        self.contentoffset=self.scrollBgview.contentOffset
        UIView.animate(withDuration: duration) {
           self.scrollBgview.contentOffset = CGPoint(x: 0, y: changeY+kScreenHeight-self.textfield.frame.origin.y-50-BottomHeight+self.scrollBgview.contentOffset.y)
        }
    }
    
    @objc func keyBoardWillHide(_ notification: Notification){
        self.bigBgBtn.isHidden = true
        let kbInfo = notification.userInfo
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double
        UIView.animate(withDuration: duration) {
              self.scrollBgview.contentOffset = self.contentoffset
        }
    }
    
    @objc func bigBgBtnClick()
    {
        self.textfield.resignFirstResponder()
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
            self.orangeLabel.backgroundColor=mainColor
        default:
            self.view.backgroundColor=UIColor.white
            activity.startAnimating()
            textfield.resignFirstResponder()
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
        let alertview=UIAlertView(title: "温馨提示", message: "进入下一页", delegate: self, cancelButtonTitle: "知道了")
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
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        let bvc = CUIBViewController()
        bvc.hidesBottomBarWhenPushed = true
        bvc.delegate=self
        self.navigationController?.pushViewController(bvc, animated: true)
    }
    
    func changeLabelText() {
        
        self.orangeLabel.backgroundColor=UIColor.orange
    }
    
    @objc func changeLabelbackground() {
        self.orangeLabel.backgroundColor = UIColor.brown
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
