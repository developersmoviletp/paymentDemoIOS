//
//  ViewUtils.swift
//  Ventas TotalPlay
//
//  Created by Daniel García Alvarado on 07/11/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit

public enum ViewVisibilityEnum{
    case GONE
    case NOT_GONE
    case VISIBLE
    case INVISIBLE
}

public class ViewUtils: NSObject {
    
    public class func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    public class func cycleFromViewController(viewController: UIViewController,
                                       inContainerView containerView: UIView,
                                       fromOldViewController oldViewController: UIViewController,
                                       toViewController newViewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView:containerView)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: viewController)
        })
    }
    
    public class func setVisibility(view : UIView, visibility : ViewVisibilityEnum, controller : UIViewController, animated : Bool? = false){
        setVisibility(view: view, visibility: visibility)
        if animated! {
            UIView.animate(withDuration: 0.3) {
                controller.view.layoutIfNeeded()
            }
        } else {
            controller.view.layoutIfNeeded()
        }
    }
    
    public class func isGone(view: UIView) -> Bool {
        for constraint in view.constraints {
            if (constraint.firstAttribute == NSLayoutAttribute.height && constraint.secondAttribute == NSLayoutAttribute.notAnAttribute) {
                if constraint.constant == 0 {
                    return true
                }
            }
        }
        return false
    }
    
    public class func setVisibility(view : UIView, visibility : ViewVisibilityEnum, animated : Bool? = false){
        view.clipsToBounds = true
        if visibility == ViewVisibilityEnum.INVISIBLE{
            view.isHidden = true
            view.isUserInteractionEnabled = false
        } else if visibility == ViewVisibilityEnum.VISIBLE {
            view.isHidden = false
            view.isUserInteractionEnabled = true
        } else if visibility == ViewVisibilityEnum.NOT_GONE{
            view.isHidden = false
            for constraint in view.constraints {
                if (constraint.firstAttribute == NSLayoutAttribute.height && constraint.secondAttribute == NSLayoutAttribute.notAnAttribute) {
                    if constraint.constant == 0 {
                        constraint.isActive = false
                    }
                }
            }
            
            var widthConstraint : NSLayoutConstraint?
            for constraint in view.constraints {
                if (constraint.firstAttribute == NSLayoutAttribute.width) {
                    widthConstraint = constraint;
                    break;
                }
            }
            if widthConstraint != nil{
                widthConstraint?.isActive = false
            }
            
            for contraint in (view.superview?.constraints)! {
                if contraint.firstAttribute == .top && contraint.secondAttribute == .bottom && (contraint.secondItem as? NSObject == view ) {
                    contraint.constant = 30
                }
                if contraint.firstAttribute == .bottom && contraint.secondAttribute == .top && (contraint.firstItem as? NSObject == view ) {
                    contraint.constant = 30
                }
            }
            
            view.reDraw()
            
        } else if visibility == ViewVisibilityEnum.GONE {
            let constraint = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0, constant: 0)
            view.addConstraint(constraint)
            let constraintWidth = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
            view.addConstraint(constraintWidth)
            
            for contraint in (view.superview?.constraints)! {
                if contraint.firstAttribute == .top && contraint.secondAttribute == .bottom && (contraint.secondItem as? NSObject == view ) {
                    contraint.constant = 0
                }
                if contraint.firstAttribute == .bottom && contraint.secondAttribute == .top && (contraint.firstItem as? NSObject == view ) {
                    contraint.constant = 0
                }
            }
            
        }
        
    }
}

extension UIView {
    /// Moves the caret to the correct position by removing the trailing whitespace
    func reDraw() {
        
    }
}
