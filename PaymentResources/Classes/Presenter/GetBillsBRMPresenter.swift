//
//  GetBillsBRMPresenter.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 03/11/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
public protocol GetBillsBRMDelegate : NSObjectProtocol{
    func onSuccessGetBillsBRM(getBillsBRMResponse: GetBillsBRMResponse)
}

public class GetBillsBRMPresenter: BaseEstrategiaPresenter {
    var mGetBillsBRMDelegate : GetBillsBRMDelegate?

    public init(viewController: BaseViewController, getBillsBRMDelegate : GetBillsBRMDelegate) {
        super.init(viewController: viewController)
        self.mGetBillsBRMDelegate = getBillsBRMDelegate
    }
    
    public func getBillsBRM(){
        let getBillsBRMRequest : GetBillsBRMRequest = GetBillsBRMRequest(accountNumber: mUser.accountNumber,userPass: UserPassIp(userId:"25631" , password: "123456789",ip:"1.1.1.1"))
        RetrofitManager<GetBillsBRMResponse>.init(requestUrl: ApiDefinition.WS_GET_BILLS_BRM, delegate: self).request(requestModel: getBillsBRMRequest)
    }
    
    override public func onSuccessLoadResponse(requestUrl: String, response: BaseResponse) {
        AlertDialog.hideOverlay()
        if (requestUrl == ApiDefinition.WS_GET_BILLS_BRM){
            onSuccessGetBillsBRM(requestUrl: requestUrl, getBillsBRMResponse: response as! GetBillsBRMResponse)
        }
    }
    
    public func onSuccessGetBillsBRM(requestUrl : String, getBillsBRMResponse: GetBillsBRMResponse){
        if getBillsBRMResponse.response?.code == "0" {
            mGetBillsBRMDelegate?.onSuccessGetBillsBRM(getBillsBRMResponse:getBillsBRMResponse)
        } else {
           
        }
    }
}
