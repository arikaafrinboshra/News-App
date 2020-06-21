//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Arika Afrin Boshra on 21/6/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var imageLbl: UILabel!
    
    override func prepareForReuse() {
        newsImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
