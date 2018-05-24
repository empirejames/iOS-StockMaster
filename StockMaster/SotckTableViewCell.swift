//
//  SotckTableViewCell.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/17.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit
import Cosmos
class SotckTableViewCell: UITableViewCell {

    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var stockNum: UILabel!
    @IBOutlet weak var stockName: UILabel!
    @IBOutlet weak var taiShiNum: UILabel!
    @IBOutlet weak var getShiNum: UILabel!
    @IBOutlet weak var taiShiDate: UILabel!
    @IBOutlet weak var thuShiDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
