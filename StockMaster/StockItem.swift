//
//  StockItem.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/18.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit
import Firebase
class StockItem {
    var ref: DatabaseReference?
    var title: String?
    
    init (snapshot: DataSnapshot) {
        ref = snapshot.ref
        
        let data = snapshot.value as! Dictionary<String, String>
        title = data["title"]! as String
    }
}
