//
//  HomeViewController.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/15.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit
import Firebase
import Cosmos

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var stockNames : [String] = []
    var thisYear : [Any] = []
    var stockNumbers : [Any] = []
    var tianxiDay : [Any] = []
    var tianxiPercents : [Float] = []
    var taiShiNumbers : [NSNumber] = []
    var releaseCounts : [NSNumber] = []
    var ref: DatabaseReference!
    
    var list = [AnyObject]()
    
    @IBOutlet weak var tableViewStock: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockNames.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! SotckTableViewCell
        //cell.stockNum.text = ListArray.object(at: indexPath.row) as! String
        cell.stockName.text = stockNames[indexPath.row]
        if stockNumbers[indexPath.row] is String{
            cell.stockNum.text = stockNumbers[indexPath.row] as? String
        } else{
            cell.stockNum.text = (stockNumbers[indexPath.row] as! NSNumber).stringValue
        }
        
        //cell.stockNum.text = stockNumbers[indexPath.row] as! String
        
        cell.taiShiNum.text = taiShiNumbers[indexPath.row].stringValue
        cell.getShiNum.text = releaseCounts[indexPath.row].stringValue
        cell.taiShiDate.text = (tianxiDay[indexPath.row] as! NSNumber).stringValue
        cell.cosmosView.rating = Double(tianxiPercents[indexPath.row])
        if thisYear[indexPath.row] is NSNumber {
            //let message = (thisYear[indexPath.row] as! NSNumber).stringValue + ": NSNumber"
            //print(message)
            cell.thuShiDate.text = (thisYear[indexPath.row] as! NSNumber).stringValue
        }else if thisYear[indexPath.row] is NSString{
            let value = ((thisYear[indexPath.row] as! NSString) as String)
            if value == ""{
                cell.thuShiDate.text = "未公告"
            }else{
                 cell.thuShiDate.text = ((thisYear[indexPath.row] as! NSString) as String)
            }
        }
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initToolBar();
        self.tableViewStock.dataSource = self
        self.tableViewStock.delegate = self
        loadDataFromFirebase()
        
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
    func loadDataFromFirebase() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ref = Database.database().reference().child("stocks")
        ref.observe(.value, with: { snapshot in
            for itemSnapShot in snapshot.children.allObjects as! [DataSnapshot]{
                let stockName = (itemSnapShot.childSnapshot(forPath: "stockName").value as? String)!
                let stockNumber = (itemSnapShot.childSnapshot(forPath: "stockNumber").value as Any ) as AnyObject
                let taiShiNumber = (itemSnapShot.childSnapshot(forPath: "tianxiCount").value as? NSNumber)!
                let releaseCount = (itemSnapShot.childSnapshot(forPath: "releaseCount").value as? NSNumber)!
                let tianxiDay = (itemSnapShot.childSnapshot(forPath: "tianxiDay").value as Any ) as AnyObject
                let thisYear = (itemSnapShot.childSnapshot(forPath: "thisYear").value as Any ) as AnyObject
                let tianxiPercent = (itemSnapShot.childSnapshot(forPath: "tianxiPercent").value as Any ) as AnyObject
                let convertPercent = ((tianxiPercent as! NSNumber).floatValue)*100/20
               // print(((tianxiPercent as! NSNumber).floatValue)*100/20)
                
                //let item = StockItem(snapshot: itemSnapShot as! DataSnapshot)
                self.tianxiPercents.append(convertPercent)
                self.stockNames.append(stockName)
                self.thisYear.append(thisYear)
                self.stockNumbers.append(stockNumber)
                self.tianxiDay.append(tianxiDay)
                self.taiShiNumbers.append(taiShiNumber)
                self.releaseCounts.append(releaseCount)
                //print(itemSnapShot)
                self.tableViewStock.reloadData()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }

}
