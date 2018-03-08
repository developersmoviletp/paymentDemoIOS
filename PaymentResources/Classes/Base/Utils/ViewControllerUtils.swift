//
//  ViewControllerUtils.swift
//  VentasTotalPlayiOS
//
//  Created by Jorge Hdez Villa on 02/01/17.
//  Copyright © 2017 TotalPlay. All rights reserved.
//

import UIKit

let storyboard: UIStoryboard = UIStoryboard(name: "views", bundle: nil)

open class ViewControllerUtils {
    
   open class func createNavigationController(viewController : BaseViewController) -> BaseNavigationViewController {
        let navigationController = BaseNavigationViewController()
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
   open class func viewController(viewController: UIViewController.Type) -> UIViewController {
        let nameController : NSString = NSStringFromClass(viewController.classForCoder()) as NSString
        let storyboard: UIStoryboard = UIStoryboard(name: "views", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!)
        return vc
    }
    
    open class func presentViewController(from: UIViewController, to: BaseViewController.Type, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        from.present(vc, animated: true, completion: nil)
    }
    
    open class func presentViewController(from: UIViewController, to: BaseViewController.Type, completion: @escaping (() -> Void)){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        from.present(vc, animated: true, completion: completion)
    }
    
    open class func presentViewControllerWithResult(from: UIViewController, to: BaseViewController.Type, request: String, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        vc.requestValue = request
        vc.resultDelegate = from as? ControllerResultDelegate
        from.present(vc, animated: true, completion: nil)
    }
    
    open class func pushViewController(from: UIViewController, to: BaseViewController.Type, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    open class func pushViewControllerWithResult(from: UIViewController, to: BaseViewController.Type, request: String, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        vc.requestValue = request
        vc.resultDelegate = from as? ControllerResultDelegate
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    open class func presentViewControllerWithNavigation(from: UIViewController, to: BaseViewController.Type, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        let navigation = createNavigationController(viewController: vc)
    
        from.present(navigation, animated: true, completion: nil)
    }
    
    open class func presentViewControllerWithNavigationForResult(from: UIViewController, to: BaseViewController.Type, request: String, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc : BaseViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! BaseViewController
        if extras != nil {
            vc.extras = extras!
        }
        let navigation : BaseNavigationViewController = createNavigationController(viewController: vc)
        navigation.requestValue = request
        navigation.resultDelegate = from as? ControllerResultDelegate
        from.present(navigation, animated: true, completion: nil)
    }
    
    open class func popUpViewController(from: UIViewController, to: UIViewController.Type, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc: PopUpViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! PopUpViewController
        vc.modalPresentationStyle = .overCurrentContext
        if extras != nil {
            vc.extras = extras!
        }
        
        from.present(vc, animated: true, completion: nil)
    }
    

    open class func popUpViewControllerForResult(from: UIViewController, to: UIViewController.Type, request: String, extras: [String : AnyObject]? = nil){
        let nameController : NSString = NSStringFromClass(to.classForCoder()) as NSString
        let vc: PopUpViewController = storyboard.instantiateViewController(withIdentifier: nameController.components(separatedBy: ".").last!) as! PopUpViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.requestValue = request
        vc.resultDelegate = from as? ControllerResultDelegate
        if extras != nil {
            vc.extras = extras!
        }
        
        from.present(vc, animated: true, completion: nil)
    }
    
    open class func popViewController(viewController: BaseViewController){
        viewController.navigationController?.popViewController(animated: true)
    }
    
    open class func popToRootViewController(viewController: BaseViewController){
        viewController.navigationController?.popToRootViewController(animated: true)
    }
    
}
