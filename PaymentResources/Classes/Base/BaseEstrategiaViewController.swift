//
//  BaseEstrategiaViewController.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 30/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class BaseEstrategiaViewController: BaseViewController {

    var mDataManager : DataManager!
    var mFormalityEntity : FormalityEntity!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        mDataManager = DataManager().getInstance()
        mFormalityEntity = mDataManager.queryWhere(object: FormalityEntity.self).findFirst()
    }
}
