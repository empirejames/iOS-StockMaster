//
//  CustomToolbar.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/16.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit

class CustomToolbar: UIToolbar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        var newSize: CGSize = super.sizeThatFits(size)
        newSize.height = 40  
        
        return newSize
    }

}
