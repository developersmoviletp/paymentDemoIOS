//
//  ViewController.swift
//  Ventas TotalPlay
//
//  Created by Mario Hernandez on 01/11/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController, UITextFieldDelegate {

    var mPresenter : BasePresenter?
    var mPresenters : [BasePresenter]! = []
    var extras : [String: AnyObject] = [:]
    var resultDelegate : ControllerResultDelegate?
    var requestValue : String = ""
    var resultValue : ViewControllerResult = ViewControllerResult.RESULT_ERROR
    var data : [String : AnyObject] = [:]
    
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
    
    func onViewControllerResult() {
        
    }
    
    func onViewControllerResult(params: [String : String]?) {
        
    }
    
    func hasExtra(key: KeysEnum) -> Bool{
        return self.extras[key] != nil
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func resignFirstResponser(textFields : UITextField...){
        for textField in textFields{
            textField.resignFirstResponder()
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

