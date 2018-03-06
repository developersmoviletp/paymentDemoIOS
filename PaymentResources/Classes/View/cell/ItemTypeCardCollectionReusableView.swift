//
//  ItemTypeCardCollectionReusableView.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 04/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class ItemTypeCardCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var typeTarjetImageView: UIImageView!
    @IBOutlet weak var numberCardLabel: UILabel!

    @IBOutlet weak var iconSelectImageView: UIImageView!
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
