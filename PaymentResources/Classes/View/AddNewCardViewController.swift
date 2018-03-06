//
//  AddNewCardViewController.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 05/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class AddNewCardViewController: BaseViewController, CardIOPaymentViewControllerDelegate {
    
    static let REQUEST_NEW_CARD : String = "requestNewCard"
    
    @IBOutlet weak var mCardNumberTextField: IconTextField!
    @IBOutlet weak var mExpirationDateTextField: IconTextField!
    @IBOutlet weak var mNameTextField: IconTextField!
    @IBOutlet weak var mLastNameTextField: IconTextField!
    @IBOutlet weak var mMotherLastNameTextField: IconTextField!
    
    var mFormValidator : FormValidator!
    var mAddNewCardPresenter : AddNewCardPresenter!
    var mCardInfo: CardIOCreditCardInfo!
    
    override public func viewWillAppear(_ animated: Bool) {
        CardIOUtilities.preload()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        mFormValidator = FormValidator(showAllErrors: true, showAnimationError: true)
        mFormValidator?.addValidators(validators:
            TextFieldValidator(textField: mCardNumberTextField, regex: RegexEnum.NOT_EMPTY, messageError: StringDialogs.dialog_error_empty),
            TextFieldValidator(textField: mExpirationDateTextField, regex: RegexEnum.NOT_EMPTY, messageError: StringDialogs.dialog_error_empty),
            TextFieldValidator(textField: mNameTextField, regex: RegexEnum.NOT_EMPTY, messageError: StringDialogs.dialog_error_empty),
            TextFieldValidator(textField: mLastNameTextField, regex: RegexEnum.NOT_EMPTY, messageError: StringDialogs.dialog_error_empty),
            TextFieldValidator(textField: mMotherLastNameTextField, regex: RegexEnum.NOT_EMPTY, messageError: StringDialogs.dialog_error_empty)
        )
        
        mExpirationDateTextField.setCreditCardDatePicker()
    }
    
    override func getPresenter() -> BasePresenter? {
        mAddNewCardPresenter = AddNewCardPresenter(viewController: self)
        return mAddNewCardPresenter
    }
    
    @IBAction func onSaveButtonClick(_ sender: Any) {
        if mFormValidator.isValid() {
            let expirationMonth = Security.crypt(text: "\(mCardInfo.expiryMonth)")
            let expirationYear = Security.crypt(text: "\(mCardInfo.expiryYear)")
            
            let name = Security.crypt(text: mNameTextField.text!.trim().uppercased())
            let lastName = Security.crypt(text: mLastNameTextField.text!.trim().uppercased())
            let secondLastName = Security.crypt(text: mMotherLastNameTextField.text!.trim().uppercased())
            let creditCardNumber = Security.crypt(text: mCardNumberTextField.text!.trim().uppercased())
            let ccType = Security.crypt(text: CreditCardUtils.GetIdTypeCard(card: mCardNumberTextField.text!.trim()))
            
            mAddNewCardPresenter.saveNewCard(expirationMonth: expirationMonth, expirationYear: expirationYear, name: name, lastName: lastName, secondLastName: secondLastName, creditCardNumber: creditCardNumber, ccType: ccType)
        }
    }
    
    @IBAction func onScanNewCard(_ sender: Any) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.modalPresentationStyle = .formSheet
        cardIOVC?.collectCVV = false
        present(cardIOVC!, animated: true, completion: nil)
    }
    
    @IBAction func onSaveAndPaymentButtonClick(_ sender: Any) {
        if mFormValidator.isValid() {
            
        }
    }
    
    public func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
    
    public func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        mCardInfo = cardInfo
        mCardNumberTextField.text = cardInfo.cardNumber
        
        let number = "\(cardInfo.expiryYear)"
        let array = number.characters.flatMap{Int(String($0))} // [1, 2, 3, 4, 5, 6]
        
        mExpirationDateTextField.text = "\(String(format: "%02d", cardInfo.expiryMonth))/\(array[2])\(array[3])"
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
