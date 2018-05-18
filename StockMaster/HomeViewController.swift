//
//  HomeViewController.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/15.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var ListArray: NSArray = ["Hello world", "Swift", "UITableView", "媽!我在這裡"]
    var yourArray = [String]()
        var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry", "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit", "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango", "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach", "Pear", "Pineapple", "Raspberry", "Strawberry"]
    var ref: DatabaseReference!
    var firstname:String=""
    var list = [AnyObject]()
    
    @IBOutlet weak var tableViewStock: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yourArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! SotckTableViewCell
        //cell.getShiNum.text = ListArray.object(at: indexPath.row) as! String
        cell.stockName.text = yourArray[indexPath.row]
        //myLabel.text = myArr[indexPath.row]
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initToolBar();
        
        self.tableViewStock.dataSource = self
        self.tableViewStock.delegate = self
        
        loadDataFromFirebase()
//        ref = Database.database().reference()
//        ref?.observe(.childAdded, with: { (snapshot) in
//
//            let snapshotValue = snapshot.value as? NSDictionary
//            let getData = snapshotValue as? String
//            print(getData)
//        })
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
    func loadDataFromFirebase() {
      var items = [StockItem]()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        ref = Database.database().reference().child("stocks")
        ref.observe(.value, with: { snapshot in

           // var tempItems = [NSDictionary]()
            for itemSnapShot in snapshot.children.allObjects as! [DataSnapshot]{
                self.firstname = (itemSnapShot.childSnapshot(forPath: "stockName").value as? String)!
                //let item = StockItem(snapshot: itemSnapShot as! DataSnapshot)
                self.yourArray.append(self.firstname)
                print(self.firstname)
                self.tableViewStock.reloadData()
            }
            let stockNumber = snapshot.value
            //print(stockNumber)
           
//            for item in snapshot.children {
//
//                //let dict = snapshot.value as! String
//                print(item)
//                //tempItems.append(dict)
//            }
            
            //self.items = tempItems
            //self.tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }

}
