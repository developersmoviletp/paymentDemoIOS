//
//  AddNewCardPresenter.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 19/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class AddNewCardPresenter: BaseEstrategiaPresenter {
    
    func saveNewCard(expirationMonth : String, expirationYear: String, name : String, lastName : String, secondLastName : String, creditCardNumber: String, ccType : String){
        let newCard : NewCard = NewCard(name: name, lastName: lastName, secondLastName: secondLastName, cardNumber: creditCardNumber, expirationMonth: expirationMonth, expirationYear: expirationYear, ccType: ccType)
        
        
        let requestModel : RegisterCardRequest = RegisterCardRequest(accountNumber: Security.crypt(text: mUser.accountNumber), newCard: newCard)
        requestModel.login = LoginRequest(user: Security.crypt(text: "25631") , password:Security.crypt(text: Security.crypt(text: "Middle100$")) , ip:Security.crypt(text: "10.10.10.10" ))
        RetrofitManager<RegisterCardResponse>.init(requestUrl: ApiDefinition.WS_ADD_NEW_CARD, delegate: self).request(requestModel: requestModel)
    }
    
    func successAddNewCardResponse(requestUrl : String, registerCardResponse : RegisterCardResponse){
        if registerCardResponse.result == "0"{
            AlertDialog.hideOverlay()
            mViewController.resultValue = .RESULT_OK
            ViewControllerUtils.popViewController(viewController: mViewController)
            AlertDialog.show( title: "¡Felicidades!", body: StringDialogs.dialog_success_save_new_card, view: mViewController)
        } else {
            onErrorLoadResponse(requestUrl : requestUrl, messageError : "")
        }
    }
    
    override public func onRequestWs(){
        AlertDialog.showOverlay()
    }
    
    override public func onSuccessLoadResponse(requestUrl : String, response : BaseResponse){
        if requestUrl == ApiDefinition.WS_ADD_NEW_CARD {
            successAddNewCardResponse(requestUrl: requestUrl, registerCardResponse: response as! RegisterCardResponse)
        }
    }
    
    override public func onErrorLoadResponse(requestUrl : String, messageError : String){
        AlertDialog.show( title: "Error", body: StringDialogs.dialog_error_intern, view: mViewController)
        AlertDialog.hideOverlay()
    }
    
}
