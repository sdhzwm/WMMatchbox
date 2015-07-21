//
//  WMTabBar.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit
/**
*  tabbar协议
*/
protocol WMTabBarDelegate{
    //点击按钮的触发时间
    func tabBar(tabBar:WMTabBar,didWMTabBarBtnClick btnIndex:Int)
}

class WMTabBar: UIView {
    var selectedBtn:WMTabBarBtn?
    var delegate:WMTabBarDelegate?
    var items:[UITabBarItem]?{
        didSet {
            if let items = items {
                
                for  barItem:UITabBarItem in items{
                    let btn = WMTabBarBtn(type: UIButtonType.Custom)
                    btn.setBackgroundImage(barItem.image, forState: UIControlState.Normal)
                    btn.setBackgroundImage(barItem.selectedImage, forState: UIControlState.Selected)
                    btn.tag = self.subviews.count;
                    btn.adjustsImageWhenHighlighted = false
                    btn.addTarget(self, action:"btnClick:", forControlEvents: UIControlEvents.TouchDown)
                    self.addSubview(btn)
                   
                    if (btn.tag == 0) {
                        self
                        self.btnClick(btn)
                    }
                }
            }
        }
    }
    /**
    按钮的触发事件
    */
    func btnClick(btn:WMTabBarBtn){
        
        self.selectedBtn?.selected = false;
        btn.selected = true;
        self.selectedBtn = btn;
        
        delegate?.tabBar(self, didWMTabBarBtnClick: btn.tag)
        
    }
    /**
    对子控件进行布局
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let count = self.subviews.count
        var x:CGFloat = 0
        let y:CGFloat = 0
        let w:CGFloat = CGFloat(UIScreen.mainScreen().bounds.size.width)/CGFloat(count)
        let h:CGFloat = self.frame.size.height
        
        for var i = 0; i<count; i++ {
            let btn = self.subviews[i]
            x = CGFloat(i) * w
            btn.frame = CGRectMake(x,y,w,h)
        }
    }
    
}

