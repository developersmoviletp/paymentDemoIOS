//
//  PackageTypeTableViewCell.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 17/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class PackageTypeTableViewCell: UITableViewCell {
    @IBOutlet weak var mTitlePlanLabel: UILabel!
    @IBOutlet weak var mIconPlusFirstImageView: UIImageView!
    @IBOutlet weak var mIconPlusSeconfImageView: UIImageView!
    @IBOutlet weak var mContentPlanView: UIView!
    @IBOutlet weak var mIconWifiImageView: UIImageView!
    @IBOutlet weak var mIconPhoneImageView: UIImageView!
    @IBOutlet weak var mIconTvImageView: UIImageView!
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mContentPlanView.layer.borderWidth = 2
        mContentPlanView.layer.borderColor = UIColor(netHex: Colors.color_grey).cgColor
        mContentPlanView.layer.cornerRadius = 4
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
