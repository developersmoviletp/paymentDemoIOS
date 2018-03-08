//
//  BaseEstrategiaPresenter.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 07/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class BaseEstrategiaPresenter: BasePresenter, AlamofireResponseDelegate {

    var mUser : User!
    
    override func viewDidLoad() {
        mUser = mDataManager.queryWhere(object: User.self).findFirst()
    }
    
    public func onRequestWs(){
        AlertDialog.showOverlay()
    }
    
    public func onSuccessLoadResponse(requestUrl : String, response : BaseResponse){
        
    }
    
    public func onErrorLoadResponse(requestUrl : String, messageError : String){
        AlertDialog.hideOverlay()
        if messageError == "" {
            AlertDialog.show( title: "Error", body: StringDialogs.dialog_error_intern, view: mViewController)
        } else {
            AlertDialog.show(title: "Ha ocurrido un error", body: messageError, view: mViewController)
        }
    }
    
    public func onErrorConnection(){
        AlertDialog.hideOverlay()
        AlertDialog.show( title: "Error", body: StringDialogs.dialog_error_connection, view: mViewController)
    }
    
}
