//
//  StockItemModel.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/12/14.
//  Copyright © 2018 韋儒朱. All rights reserved.
//

import UIKit

class StockItemModel {
    
    var convertPercent: Float?
    var stockName: String?
    var thisYear: AnyObject?
    var stockNumber: String?
    var tianxiDay: String?
    var taiShiNumber: NSNumber?
    var releaseCount: NSNumber?
    
    
    init(convertPercent: Float?, stockName: String?, thisYear: AnyObject?, stockNumber: String?, tianxiDay: String?, taiShiNumber: NSNumber?, releaseCount: NSNumber?){
        self.convertPercent = convertPercent
        self.stockName = stockName
        self.thisYear = thisYear
        self.stockNumber = stockNumber
        self.tianxiDay = tianxiDay
        self.taiShiNumber = taiShiNumber
        self.releaseCount = releaseCount
    }
}
