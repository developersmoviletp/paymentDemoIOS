
//
//  PayServiceViewController.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 04/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

open class PayServiceViewController: BaseViewController, CardsCarruselDelegate, ControllerResultDelegate, PayServiceDelegate,GetBillsBRMDelegate {
    

    @IBOutlet weak var listCardICarousel: iCarousel!
    @IBOutlet weak var mTotalAmountLabel: UILabel!
    @IBOutlet weak var mTotalToPayLabel: UILabel!
    @IBOutlet weak var mLimitDateLabel: UILabel!
    @IBOutlet weak var mPriceProntoPagoLabel: UILabel!
    @IBOutlet weak var mLimitDateProntoPagoLabel: UILabel!
    @IBOutlet weak var mDateCutLabel: UILabel!
    
    var mPayServicePresenter : PayServicePresenter!
    
    //var mAditionalsDataSource : BaseDataSource<Addons, AditionalTableViewCell>!
    var cardsCarruselDataSource : CardsCarruselDataSource!
    var mGetBillsBRMPresenter : GetBillsBRMPresenter?
    var auxPay : Int = 0
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        clearData()
            
        cardsCarruselDataSource = CardsCarruselDataSource(carrusel: listCardICarousel, delegate: self)
        cardsCarruselDataSource.settings()
        mPayServicePresenter.loadBalance()
        mPayServicePresenter.loadAccountCards()
        mPayServicePresenter.getBillsBRM()
        //mGetBillsBRMPresenter?.getBillsBRM()
    }
    
    override func getPresenter() -> BasePresenter? {
        mPayServicePresenter = PayServicePresenter(viewController: self, payServiceDelegate: self, getBillsBRMDelegate: self)
        //mGetBillsBRMPresenter = GetBillsBRMPresenter(viewController: self, getBillsBRMDelegate: self)
        return mPayServicePresenter
    }

    
    func clearData(){

    }
    
    func onSuccessGetBillsBRM(getBillsBRMResponse: GetBillsBRMResponse) {
        //earlyPaymentDate.dateFormat = "dd/MM/yyyy"
        //limitPaymentDate.dateFormat = "dd/MM/yyyy"
        //proceso sin tocar
        auxPay = getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay == nil ? 0 :
            (getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay!)!
        mTotalToPayLabel.text = "$\(String(format: "%i.00", auxPay))"
        mLimitDateLabel.text = getBillsBRMResponse.billingInfo?.lastBillBalance?.paymentDeadLine
        auxPay = getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPayDiscount == nil ? 0:
            (getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPayDiscount!)!
        mPriceProntoPagoLabel.text = "$\(String(format: "%i.00", auxPay))"
        mLimitDateProntoPagoLabel.text = getBillsBRMResponse.billingInfo?.lastBillBalance?.earlyPaymentDeadline
        mDateCutLabel.text = getBillsBRMResponse.billingInfo?.lastBillBalance?.cuOffData
        //Proceso de deciciones
        /*if(mCheckBalanceBRMResponse != nil){
            if(earlyPaymentDate.date(from : (getBillsBRMResponse.billingInfo?.lastBillBalance?.earlyPaymentDeadline)!)! == Date() ||
                Date() < earlyPaymentDate.date(from : (getBillsBRMResponse.billingInfo?.lastBillBalance?.earlyPaymentDeadline)!)!){
                if(mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable == nil
                    &&  Int((mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable)!)! == getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay){
                    mTotalAmountLabel.text = "$\(String(format: "%i.00", auxPay))"
                }
                else{
                    let balance = mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable
                    mTotalAmountLabel.text = NSString(format: "$ %.2f", (balance?.toDouble())!) as String
                }
                
            }
            else if(limitPaymentDate.date(from : (getBillsBRMResponse.billingInfo?.lastBillBalance?.paymentDeadLine)!)! == Date() ||
                Date() > earlyPaymentDate.date(from : (getBillsBRMResponse.billingInfo?.lastBillBalance?.earlyPaymentDeadline)!)!){
                if(mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable == nil
                    &&  Int((mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable)!)! == getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay){
                    auxPay = getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay == nil ? 0 :
                        (getBillsBRMResponse.billingInfo?.lastBillBalance?.totalPlay!)!
                     mTotalAmountLabel.text = "$\(String(format: "%i.00", auxPay))"
                }
                else{
                    let balance = mCheckBalanceBRMResponse.arrResult?.arrDatosFactura?.totalPayable
                    mTotalAmountLabel.text = NSString(format: "$ %.2f", (balance?.toDouble())!) as String

                }
                
            }
            
        }*/
    
    }
    
    func onSuccessLoadCheckBalance(checkBalanceResponse : CheckBalanceBRMResponse){
        /*mAditionalsDataSource.update(items: listAddons)
        mAditionalsDataSource.setHeightContent()*/
        
        let balance = checkBalanceResponse.arrResult?.arrDatosFactura?.totalPayable
        mTotalAmountLabel.text = NSString(format: "$ %.2f", Double(balance!)!) as String
        
    }
    
    func onSuccessLoadAccountCards(cards : [Card]){
        cardsCarruselDataSource.update(cards: cards)
    }
    
    func onSuccessLoadInfoPackage(packageName : String, packagePayment : String, balance : String){
     if balance != "" {
            let totalAmount : Double = Double(balance)!
            mTotalAmountLabel.text = NSString(format: "$ %.2f", totalAmount) as String
        }
    }
    
    @IBAction func onNextClick(_ sender: Any) {
        if cardsCarruselDataSource.selectedCardItem != nil {
            mPayServicePresenter.amountToPay(card1: cardsCarruselDataSource.selectedCardItem)
        } else {
            onItemAddNewCardClick()
        }
    }
    
    public func onItemCardClick(){
        
    }
    
    public func viewControllerForResult(keyRequest : String, result : ViewControllerResult, data : [String : AnyObject]){
        if result == .RESULT_OK {
            if keyRequest == AddNewCardViewController.REQUEST_NEW_CARD {
                mPayServicePresenter.loadAccountCards()
            }
        }
    }
    
    func onRefreshBalance() {
            mPayServicePresenter.loadBalance()
    }
    
    public func onItemAddNewCardClick(){
        ViewControllerUtils.pushViewControllerWithResult(from: self, to: AddNewCardViewController.self, request: AddNewCardViewController.REQUEST_NEW_CARD, extras: nil)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
