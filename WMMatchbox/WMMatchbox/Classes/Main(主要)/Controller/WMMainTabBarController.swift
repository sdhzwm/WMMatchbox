//
//  WMMainTabBarController.swift
//  WMMatchbox
//
//  Created by 王蒙 on 15/7/21.
//  Copyright © 2015年 wm. All rights reserved.
//

import UIKit

class WMMainTabBarController: UITabBarController,WMTabBarDelegate {
    var items = [UITabBarItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载控制器
        self.setUpController()
        //设置tabBar
        self.setUpTabBar()
    }
    
    /**
     *加载控制器，tabbar的图片与标题
    */
    func setUpController(){
    
        let topic = WMTopController()
     
        self.setAddChildController(topic, image: UIImage(named: "Social_Topic")!, selImage: UIImage(named: "Social_Topic_Select")!, title: "")
        let one = WMOneController()
         self.setAddChildController(one, image: UIImage(named: "Social_One")!, selImage: UIImage(named: "Social_One_Select")!, title: "火柴盒大会")
        let message = WMMessageController()
         self.setAddChildController(message, image: UIImage(named: "Social_Messages")!, selImage: UIImage(named: "Social_Messages_Select")!, title: "消息")
        let firend = WMFirendController()
         self.setAddChildController(firend, image: UIImage(named: "Social_Friend")!, selImage: UIImage(named: "Social_Friend_Select")!, title: "好友")
        let privateMe = WMPrivateController()
         self.setAddChildController(privateMe, image: UIImage(named: "Social_Private")!, selImage: UIImage(named: "Social_Private_Select")!, title: "我")
    }
    /**
    *添加到控制器
    */
    func setAddChildController(vc:UIViewController,image:UIImage,selImage:UIImage,title:String){
        
        self.items.append(vc.tabBarItem)
        vc.view.backgroundColor = self.RandomColor()
        vc.tabBarItem.image = image;
        vc.tabBarItem.selectedImage = selImage;
        vc.navigationItem.title = title;
        
        let nvc=WMNavigationController(rootViewController:vc);
        self.addChildViewController(nvc)

    }
    /**
    设置默认项
    
    :param: tabBar   自定义tabBar
    :param: btnIndex 坐标
    */
    func tabBar(tabBar: WMTabBar, didWMTabBarBtnClick btnIndex: Int) {
        self.selectedIndex = btnIndex
    }
    /**
    设置tabBar及布局
    */
    func setUpTabBar(){
       self.tabBar.removeFromSuperview()
        let tabBar = WMTabBar()
        tabBar.items = self.items;
        tabBar.delegate = self;
        tabBar.frame = self.tabBar.frame;
        self.view .addSubview(tabBar)
    }
    /**
    *随机色，之后会废除
    */
    func RandomColor() ->UIColor{
        let hue = CGFloat(arc4random_uniform(256))/255.0
        let brightness = CGFloat(arc4random_uniform(256))/255.0 + 0.5
        let saturation = CGFloat(arc4random_uniform(256))/255.0 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
}
