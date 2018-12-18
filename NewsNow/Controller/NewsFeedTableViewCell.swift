//
//  NewsFeedTableViewCell.swift
//  NewsNow
//
//  Created by Anand Nigam on 18/12/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsFeedImageView: UIImageView!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    
    @IBOutlet weak var newsDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
