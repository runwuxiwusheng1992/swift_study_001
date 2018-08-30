//
//  SpringVC.swift
//  Swift_study_1
//
//  Created by 好价 on 2018/8/30.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit
import Spring

class SpringVC: BaseVC{
    
    
    
    var ballView: SpringView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="spring动画"
        
        ballView = SpringView(frame: CGRect(x: (kScreenWidth-100)/2, y: (kScreenHeight-NavHeight-100)/2-100, width: 100, height: 100))
        ballView.backgroundColor=mainColor
        self.view.addSubview(ballView)
       
        
        /*
         .Shake,
         .Pop,
         .Morph,
         .Squeeze,
         .Wobble,
         .Swing,
         .FlipX,
         .FlipY,
         .Fall,
         .SqueezeLeft,
         .SqueezeRight,
         .SqueezeDown,
         .SqueezeUp,
         .SlideLeft,
         .SlideRight,
         .SlideDown,
         .SlideUp,
         .FadeIn,
         .FadeOut,
         .FadeInLeft,
         .FadeInRight,
         .FadeInDown,
         .FadeInUp,
         .ZoomIn,
         .ZoomOut,
         .Flash
         */
        
        
        /*
         .EaseIn,
         .EaseOut,
         .EaseInOut,
         .Linear,
         .Spring,
         .EaseInSine,
         .EaseOutSine,
         .EaseInOutSine,
         .EaseInQuad,
         .EaseOutQuad,
         .EaseInOutQuad,
         .EaseInCubic,
         .EaseOutCubic,
         .EaseInOutCubic,
         .EaseInQuart,
         .EaseOutQuart,
         .EaseInOutQuart,
         .EaseInQuint,
         .EaseOutQuint,
         .EaseInOutQuint,
         .EaseInExpo,
         .EaseOutExpo,
         .EaseInOutExpo,
         .EaseInCirc,
         .EaseOutCirc,
         .EaseInOutCirc,
         .EaseInBack,
         .EaseOutBack,
         .EaseInOutBack
         */
        
        
    }
    
    func setoptions() {
       
        ballView.force = 1
        ballView.duration = 2
        ballView.delay = 2
        ballView.damping = 0.7
        ballView.velocity = 0.7
        ballView.scaleX = 0.5
        ballView.scaleY = 0.5
        ballView.x = 0.5
        ballView.y = 0.5
        ballView.rotate = 0
        ballView.animation = "pop"
        ballView.curve = "EaseOut"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("1234")
        self.setoptions()
        ballView.animate()
    }
    
    
}
