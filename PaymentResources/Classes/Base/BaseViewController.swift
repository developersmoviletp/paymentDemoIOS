//
//  ViewController.swift
//  Ventas TotalPlay
//
//  Created by Mario Hernandez on 01/11/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController, UITextFieldDelegate {

    open var mPresenter : BasePresenter?
    open var mPresenters : [BasePresenter]! = []
    open var extras : [String: AnyObject] = [:]
    open var resultDelegate : ControllerResultDelegate?
    open var requestValue : String = ""
    open var resultValue : ViewControllerResult = ViewControllerResult.RESULT_ERROR
    open var data : [String : AnyObject] = [:]
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        mPresenter = getPresenter()
        mPresenters = getPresenters()
        if mPresenter != nil {
            mPresenter?.viewDidLoad()
        }
        for presenter in mPresenters! {
            presenter.viewDidLoad()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        if mPresenter != nil {
            mPresenter?.viewDidAppear()
        }
        for presenter in mPresenters! {
            presenter.viewDidAppear()
        }
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        if resultDelegate != nil {
            resultDelegate?.viewControllerForResult(keyRequest: requestValue, result: resultValue, data: data)
        }
        if mPresenter != nil {
            mPresenter?.viewDidDisappear()
        }
        for presenter in mPresenters! {
            presenter.viewDidDisappear()
        }
    }
    
    func getPresenter() -> BasePresenter? {
        return nil
    }
    
    func getPresenters() -> [BasePresenter]? {
        return []
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mPresenter != nil {
            mPresenter?.viewWillAppear()
        }
        for presenter in mPresenters! {
            presenter.viewWillAppear()
        }
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if mPresenter != nil {
            mPresenter?.viewWillDisappear()
        }
        for presenter in mPresenters! {
            presenter.viewWillDisappear()
        }
    }
    
    open func onViewControllerResult() {
        
    }
    
    open func onViewControllerResult(params: [String : String]?) {
        
    }
    
    func hasExtra(key: KeysEnum) -> Bool{
        return self.extras[key] != nil
    }
    
    @objc open func hideKeyboard() {
        view.endEditing(true)
    }
    
    open func resignFirstResponser(textFields : UITextField...){
        for textField in textFields{
            textField.resignFirstResponder()
        }
    }
    
    open  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

