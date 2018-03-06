//
//  DescriptionPackageTableViewCell.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 05/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class DescriptionPackageTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconDescriptionImageView: UIImageView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
