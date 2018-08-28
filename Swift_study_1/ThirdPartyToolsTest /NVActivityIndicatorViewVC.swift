//
//  NVActivityIndicatorViewVC.swift
//  Swift_study_1
//
//  Created by 好价 on 2018/8/28.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NVActivityIndicatorViewVC: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        
        self.navigationItem.title="NVActivityIndicatorView"
        let backBtn = UIButton(frame: CGRect(x: -20, y: 0, width: 25, height: 25))
        backBtn.setImage(UIImage(named: "nav_back"), for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        backBtn.imageEdgeInsets=UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        let item = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItems = [item]
        

//NVActivityIndicatorType
        
//        1. ballPulse    2. ballGridPulse    3. ballClipRotate    4. squareSpin
//        5. ballClipRotatePulse    6. ballClipRotateMultiple    7. ballPulseRise    8. ballRotate
//        9. cubeTransition    10. ballZigZag    11. ballZigZagDeflect    12. ballTrianglePath
//        13. ballScale    14. lineScale    15. lineScaleParty    16. ballScaleMultiple
//        17. ballPulseSync    18. ballBeat    19. lineScalePulseOut    20. lineScalePulseOutRapid
//        21. ballScaleRipple    22. ballScaleRippleMultiple    23. ballSpinFadeLoader    24. lineSpinFadeLoader
//        25. triangleSkewSpin    26. pacman    27. ballGridBeat    28. semiCircleSpin
//        29. ballRotateChase    30. orbit    31. audioEqualizer    32. circleStrokeSpin
        

        let cols = 4
        let rows = 8
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int((self.view.frame.height-NavHeight) / CGFloat(rows))

        (NVActivityIndicatorType.ballPulse.rawValue ... NVActivityIndicatorType.circleStrokeSpin.rawValue).forEach {
            let x = ($0 - 1) % cols * cellWidth
            let y = ($0 - 1) / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType(rawValue: $0)!, color: mainColor, padding: 0)
            let animationTypeLabel = UILabel(frame: frame)

            animationTypeLabel.text = String($0)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.white
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height

            activityIndicatorView.padding = 20
            if $0 == NVActivityIndicatorType.orbit.rawValue {
                activityIndicatorView.padding = 0
            }
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimating()
        }
        
    }
    
    @objc func back(){

        self.navigationController?.popViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
