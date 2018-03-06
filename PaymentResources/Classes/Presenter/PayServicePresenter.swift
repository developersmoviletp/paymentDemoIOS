//
//  PayServicePresenter.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 19/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

protocol PayServiceDelegate : NSObjectProtocol {
    
    func onSuccessLoadCheckBalance(checkBalanceResponse: CheckBalanceBRMResponse)
    
    func onSuccessLoadAccountCards(cards : [Card])
    
    func onSuccessLoadInfoPackage(packageName : String, packagePayment : String, balance : String)
    
    func onSuccessGetBillsBRM(getBillsBRMResponse: GetBillsBRMResponse)
    
    func onRefreshBalance()
    
}

public class PayServicePresenter: BaseEstrategiaPresenter {
    
    var mPayServiceDelegate : PayServiceDelegate!
    var selectedCard : Card!
    var mCheckBalanceResponse : CheckBalanceBRMResponse!
    var mGetBillsBRMDelegate : GetBillsBRMDelegate!
    
    init(viewController: BaseViewController, payServiceDelegate : PayServiceDelegate, getBillsBRMDelegate:GetBillsBRMDelegate ) {
        super.init(viewController: viewController)
        self.mPayServiceDelegate = payServiceDelegate
        self.mGetBillsBRMDelegate = getBillsBRMDelegate
    }
    
    func loadBalance(){
        let requestModel : CheckBalanceBRMRequest = CheckBalanceBRMRequest(accountNumber: mUser.accountNumber)
        RetrofitManager<CheckBalanceBRMResponse>.init(requestUrl: ApiDefinition.WS_CHECK_BALANCE_BRM, delegate: self).request(requestModel: requestModel)
    }
    
    func paymentWithCard(amount1 : String, card : Card){
        selectedCard = card
        let alert = UIAlertController(title: "Confimar pago", message: "Por seguridad, ingresa el código de seguridad que se encuentra al reverso de tu tarjeta (CVV)", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "CVV"
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if(textField?.text?.characters.count == 3){
                self.payWithCard(amount: amount1, cvv: (textField?.text)!)
            }
            else {
                AlertDialog.show(title: "CVV incorrecto", body: "Ingresa un cvv válido", view: self.mViewController)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            self.mViewController.dismiss(animated: true, completion: nil)
        }))
        
        mViewController.present(alert, animated: true, completion: nil)
    }
    
    func amountToPay(card1: Card){
            let alert = UIAlertController(title: "Cantidad a pagar", message: "digita la cantidad que deseas cargar a tu cuenta", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.placeholder = (self.mCheckBalanceResponse.arrResult?.arrDatosFactura?.totalPayable)!
                //textField.text = "500"
                textField.keyboardType = UIKeyboardType.numberPad
            }
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { [weak alert] (_) in
                let textfield = alert?.textFields![0]
                self.paymentWithCard(amount1 : (textfield?.text)!, card: card1)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                self.mViewController.dismiss(animated: true, completion: nil)
            }))
            
            self.mViewController.present(alert, animated: true, completion: nil)
        
    }
    
    
    func payWithCard(amount : String, cvv : String){
        if Int(amount)! >= 1 {
            let request : PaymentRegisteredCardRequest = PaymentRegisteredCardRequest(accountNumber: mUser.accountNumber, idCard: selectedCard.idCard, amount: Security.crypt(text: amount), cvv: Security.crypt(text: cvv))
            RetrofitManager<PaymentRegisteredCardResponse>.init(requestUrl: ApiDefinition.WS_PAYMENT_REGISTERED_CARD, delegate: self).request(requestModel: request)
        } else {
            AlertDialog.show(title: "Monto incorrecto", body: "Su pago debe ser mayor a 0 pesos", view: mViewController)
        }
    }
    
    func loadAccountCards(){
        let requestModel : RegisteredCardsRequest = RegisteredCardsRequest(accountNumber: mUser.accountNumber)
        RetrofitManager<RegisteredCardsResponse>.init(requestUrl: ApiDefinition.WS_MY_ACCOUNT_CARDS, delegate: self).request(requestModel: requestModel)
    }
    
    func successLoadCheckBalanceResponse(requestUrl : String, checkBalanceResponse : CheckBalanceBRMResponse){
        mCheckBalanceResponse = checkBalanceResponse
        if checkBalanceResponse.arrResult?.result == 0{
            mPayServiceDelegate.onSuccessLoadCheckBalance(checkBalanceResponse: checkBalanceResponse)
            //mPayServiceDelegate.onSuccessLoadInfoPackage(packageName: checkBalanceResponse.packageName, packagePayment: checkBalanceResponse.packagePayment, balance: checkBalanceResponse.balance)
        } else {
            onErrorLoadResponse(requestUrl : requestUrl, messageError : "")
        }
    }
    
    func successLoadAccountCards(requestUrl : String, registeredCardsResponse : RegisteredCardsResponse){
        if registeredCardsResponse.result == "0"{
            mPayServiceDelegate.onSuccessLoadAccountCards(cards: registeredCardsResponse.cards)            
        } else {
            onErrorLoadResponse(requestUrl : requestUrl, messageError : "")
        }
    }
    
    func successPaymentWithCard(requestUrl : String, paymentRegisteredCardResponse : PaymentRegisteredCardResponse){
        if (paymentRegisteredCardResponse.resultValue == "0") {
            AlertDialog.hideOverlay()
            let alert = UIAlertController(title: "Pago Existoso", message: "Número de Transacción: \(paymentRegisteredCardResponse.transactionNumber!)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { [weak alert] (_) in
                self.mPayServiceDelegate.onRefreshBalance()
                ViewControllerUtils.popViewController(viewController: self.mViewController)
            }))
            mViewController.present(alert, animated: true, completion: nil)
            
        } else {
            onErrorLoadResponse(requestUrl: requestUrl, messageError: paymentRegisteredCardResponse.resultDescription)
        }
    }

    override public func onSuccessLoadResponse(requestUrl : String, response : BaseResponse){
        
        if requestUrl == ApiDefinition.WS_CHECK_BALANCE_BRM {
            successLoadCheckBalanceResponse(requestUrl: requestUrl, checkBalanceResponse: response as! CheckBalanceBRMResponse)
        } else if requestUrl == ApiDefinition.WS_MY_ACCOUNT_CARDS {
            successLoadAccountCards(requestUrl: requestUrl, registeredCardsResponse: response as! RegisteredCardsResponse)
        } else if requestUrl == ApiDefinition.WS_PAYMENT_REGISTERED_CARD{
            successPaymentWithCard(requestUrl: requestUrl, paymentRegisteredCardResponse: response as! PaymentRegisteredCardResponse)
        } else if (requestUrl == ApiDefinition.WS_GET_BILLS_BRM){
            onSuccessGetBillsBRM(requestUrl: requestUrl, getBillsBRMResponse: response as! GetBillsBRMResponse)
        }
    }
    
    func getBillsBRM(){
        let getBillsBRMRequest : GetBillsBRMRequest = GetBillsBRMRequest(accountNumber: mUser.accountNumber,userPass: UserPassIp(userId:"1002152" , password: "MtpeMobile34%82",ip:"1.1.1.1"))
        RetrofitManager<GetBillsBRMResponse>.init(requestUrl: ApiDefinition.WS_GET_BILLS_BRM, delegate: self).request(requestModel: getBillsBRMRequest)
    }
    
    func onSuccessGetBillsBRM(requestUrl : String, getBillsBRMResponse: GetBillsBRMResponse){
        if getBillsBRMResponse.response?.code == "0" {
            mGetBillsBRMDelegate?.onSuccessGetBillsBRM(getBillsBRMResponse:getBillsBRMResponse)
            AlertDialog.hideOverlay()
        } else {
            onErrorLoadResponse(requestUrl : requestUrl, messageError : "")
        }
    }

    
}
