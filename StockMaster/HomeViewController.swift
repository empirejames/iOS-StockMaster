//
//  HomeViewController.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/15.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        initToolBar();
        // Do any additional setup after loading the view.
        
        //refArtists = FIRDatabase.database().reference().child("artists");
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.navigationController?.setToolbarHidden(false, animated: animated)

    }
    @objc func backClick(_ sender:UIBarButtonItem) {
        //后退
        print("后退按钮点击")
    }
    @objc func filterClick(_ sender:UIBarButtonItem) {
        //后退
        print("Filter")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initToolBar(){
        let toolBar =  UIToolbar(frame:CGRect(x:0, y:20, width:UIScreen.main.bounds.width, height:44))
        self.view.addSubview(toolBar)
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        myLabel.text = "權息大師"
        //myLabel.textColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        let btnBack =  UIBarButtonItem(customView: myLabel)
        
        
        let btnGap1 =  UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                       target:nil,
                                       action:nil)
        let btnSearch =  UIBarButtonItem(barButtonSystemItem:.search,
                                         target:nil, action:nil);
        let btnGap2 =  UIBarButtonItem(barButtonSystemItem:.fixedSpace,
                                       target:nil,
                                       action:nil)
        btnGap2.width = 10
        let btnFilter = UIBarButtonItem(image:UIImage(named:"ic_action_filter.png"),
                                        style: .plain, target:self,
                                        action:#selector(filterClick(_:)))
        toolBar.setItems([btnBack,btnGap1,btnSearch,btnGap2,btnFilter], animated: false)
    }

}
