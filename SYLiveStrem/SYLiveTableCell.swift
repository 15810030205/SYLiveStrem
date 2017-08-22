//
//  SYLiveTableCell.swift
//  SYLiveStrem
//
//  Created by 郝松岩 on 2017/8/22.
//  Copyright © 2017年 hsy. All rights reserved.
//

import UIKit

class SYLiveTableCell: UITableViewCell {

    @IBOutlet weak var imgpro: UIImageView!
    
    @IBOutlet weak var nick: UILabel!
    
    @IBOutlet weak var addr: UILabel!
    @IBOutlet weak var viewers: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
