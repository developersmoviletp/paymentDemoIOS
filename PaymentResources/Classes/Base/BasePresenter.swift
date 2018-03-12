//
//  BasePresenter.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 27/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

open class BasePresenter: NSObject {
    
    open var mViewController : BaseViewController
    open var mDataManager : DataManager!
    
      init(viewController : BaseViewController){
        self.mViewController = viewController
        mDataManager = DataManager().getInstance()
    }
    
    func viewDidLoad(){
    }
    
    func viewWillAppear(){
    }
    
    func viewDidAppear(){
    }
    
    func viewWillDisappear(){
    }
    
    func viewDidDisappear(){
    }
    
    func viewDidUnload(){
    }
    
}

