//
//  ViewController.swift
//  scroll
//
//  Created by 楼顶-1 on 15/11/24.
//  Copyright (c) 2015年 楼顶-1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
    var tableView:UITableView!
    var scoll : UIScrollView!
    var v:UIView!
    var label:UILabel!
    var topView : UIView!
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    let tabHeight:CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoll = UIScrollView(frame: CGRectMake(0, 20, width, height-20))
        //scoll.delegate = self
        v = UIView(frame: CGRectMake(0, 0, width, tabHeight))
        label = UILabel(frame: CGRectMake(0, 60, width, 40))
        label.textAlignment = NSTextAlignment.Center
        label.text = "坑爹"
        v.addSubview(label)
        v.backgroundColor = UIColor.redColor()
        scoll.addSubview(v)
        tableView = UITableView(frame: CGRectMake(0, tabHeight, width, height-20))
        tableView.clipsToBounds = false
        tableView.dataSource = self
        tableView.delegate = self
        scoll.addSubview(tableView)
        scoll.bouncesZoom = false
        scoll.bounces = false
        scoll.contentSize = CGSizeMake(width, 0)
        self.view.addSubview(scoll)
//        topView = UIView(frame: CGRectMake(0, 20, width, 40))
//        self.view.addSubview(topView)
//        topView.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scoll.bringSubviewToFront(v)
        print("tableView.contentOffset.y:\(tableView.contentOffset.y)\n", terminator: "")
        print("scrollView == tableView:\(scrollView == tableView)", terminator: "")
        if tableView.contentOffset.y<=tabHeight{
            
            scoll.contentOffset = tableView.contentOffset
            v.frame.origin.y = -tableView.contentOffset.y

        }else{
            scoll.contentOffset = CGPointMake(0, tabHeight)
        }
        
        if scrollView == tableView && tableView.contentOffset.y>tabHeight{
            
            scoll.contentOffset = CGPointMake(0, tabHeight)

            
        }
       
        if scoll.contentOffset.y <= 0 {
          v.frame.origin.y = 0
            scoll.contentOffset = CGPointMake(0, 0)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return width*3/4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return  5
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.imageView?.backgroundColor = UIColor.grayColor()
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
}


