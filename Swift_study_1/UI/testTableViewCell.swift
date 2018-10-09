//
//  testTableViewCell.swift
//  Swift_study_1
//
//  Created by 好价 on 2018/9/20.
//  Copyright © 2018年 好价. All rights reserved.
//

import UIKit

class testTableViewCell: UITableViewCell {
    
    var leftImageView:UIImageView?
    var contentLabel:UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        leftImageView = UIImageView(frame: CGRect(x: scale*30, y: scale*30, width: 110*scale, height: 60*scale))
        leftImageView?.backgroundColor=UIColor.orange
        self.contentView.addSubview(leftImageView!)
        
        contentLabel = UILabel(frame: CGRect(x: 170*scale, y: 45*scale, width: 120*scale, height: 30*scale))
        contentLabel?.backgroundColor=UIColor.green;
        self.contentView.addSubview(contentLabel!);
    }
}
