//
//  ViewController.swift
//  MySwift
//
//  Created by 聚美家科技有限公司 on 16/1/28.
//  Copyright © 2016年 吴天祥. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate

{
    var isview :isViewController!
    var dataTable:UITableView!;
    //数据表格
    var itemString = ["昵称","账号","性别","地区","我的爱车"]
    //当前屏幕对象
    var screenObject=UIScreen.mainScreen().bounds;
    
    @IBOutlet weak var btn: UIButton!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rectRect:CGRect = CGRectMake(20,60,60, 80)
        
        let label:UILabel = UILabel(frame:rectRect)
        
        label.text = "here"
        
        label.textColor = UIColor.redColor()
        label.backgroundColor = UIColor.grayColor()
        self.view.addSubview(label)
        
        btn.frame = CGRectMake(0, 200, self.view.frame.size.width, 80)
        btn.setTitleColor(UIColor .redColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.greenColor()
        btn.setTitle("按钮", forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("btnClick:"), forControlEvents:.TouchUpInside)
        
//        initView()
        
        
        
    }
    
    /**
     UI 初始化
     */
    func initView(){
        self.title="我的资料";
        self.view.backgroundColor=UIColor.redColor();
        creatTable();
    }
    /**
     我的资料表格初始化
     */
    func creatTable(){
        let dataTableW:CGFloat=screenObject.width;
        let dataTableH:CGFloat=screenObject.height;
        let dataTableX:CGFloat=0;
        let dataTableY:CGFloat=0;
        dataTable=UITableView(frame: CGRectMake(dataTableX, dataTableY, dataTableW, dataTableH),style:UITableViewStyle.Grouped);
        dataTable.delegate = self;
        //实现代理
        dataTable.dataSource = self;
        //实现数据源
        self.view.addSubview(dataTable);
    }
    //1.1默认返回一组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    // 1.2 返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1;
        }else{
            return 5;
        }
    }
    
    //1.3 返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        if(indexPath.section == 0){
            return 80;
        }else
        {
            return 55;
        }
    }
    //1.4每组的头部高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    //1.5每组的底部高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }
    //1.6 返回数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        
        if(indexPath.section == 0){
            cell?.textLabel?.text="头像";
        }else{
            cell?.textLabel?.text=itemString[indexPath.row];
        }
        cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        return cell!;
    }
    //1.7 表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        let imp:Float = 10.02
        let impString = String(imp)
        
        var impstr = "abc,\(impString)"
        
        impstr = impString
        
        print("Hello,world",impString,"阿斯顿",impstr)
        if indexPath.row == 2
        {

        }
        
    }
    
    
    
    
    func btnClick(btns:UIButton)
    {
        if (btns.titleLabel?.text == "点我")
        {
             btns.setTitle("阿斯顿", forState: UIControlState.Normal)
            let secondVC:isViewController = isViewController()
            //////present方式
            self.presentViewController(secondVC, animated: true, completion: nil)
        }
        else
        {
        btns.setTitle("点我", forState: UIControlState.Normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

