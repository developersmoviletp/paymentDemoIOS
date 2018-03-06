//
//  PlansDataSource.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 17/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import Foundation
import UIKit

protocol PlansTableViewDelegate : NSObjectProtocol {
   func onItemClick(item: [ArrPlan])
}

public class PlansDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    var tableView : UITableView?
    var clickTableViewDelegate: PlansTableViewDelegate?
    var arrFamily : [ArrFamily]  = []
    var cell: PackageTypeTableViewCell?
    
    init(tableView: UITableView, clickTableViewDelegate: PlansTableViewDelegate){
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.clickTableViewDelegate = clickTableViewDelegate
    }
    
    func update(arrayFamily: ProductMasterPlanesResponse){
        self.arrFamily = arrayFamily.arrFamily
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFamily.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "PackageTypeTableViewCell"
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PackageTypeTableViewCell
        
        let item = self.arrFamily[indexPath.row]
        
        print(indexPath.row)
        
        if(item.nameFamily == "Dobleplay 2.0"){
            cell?.mTitlePlanLabel.text = item.nameFamily
            cell?.mTitlePlanLabel.textColor = UIColor(netHex: Colors.color_white)
            
            ViewUtils.setVisibility(view: (cell?.mIconTvImageView)!, visibility: .GONE)
            ViewUtils.setVisibility(view: (cell?.mIconPlusFirstImageView)!, visibility: .GONE)
            
            cell?.mIconWifiImageView.image = cell?.mIconWifiImageView.image?.withRenderingMode(.alwaysTemplate)
            cell?.mIconPhoneImageView.image = cell?.mIconPhoneImageView.image?.withRenderingMode(.alwaysTemplate)
            
            
            cell?.mIconWifiImageView.tintColor = UIColor(netHex: Colors.color_grey)
            cell?.mIconPhoneImageView.tintColor = UIColor(netHex: Colors.color_grey)
            
            ViewUtils.setVisibility(view: (cell?.mIconWifiImageView)!, visibility: .VISIBLE)
            ViewUtils.setVisibility(view: (cell?.mIconPhoneImageView)!, visibility: .VISIBLE)
        }else{
            if(item.nameFamily == "Dobleplay TV"){
                
                cell?.mTitlePlanLabel.textColor = UIColor(netHex: Colors.color_white)
                cell?.mTitlePlanLabel.text = item.nameFamily
                
                cell?.mIconPhoneImageView.image = cell?.mIconTvImageView.image?.withRenderingMode(.alwaysTemplate)
                cell?.mIconWifiImageView.image = cell?.mIconWifiImageView.image?.withRenderingMode(.alwaysTemplate)
                
                
                cell?.mIconPhoneImageView.tintColor = UIColor(netHex: Colors.color_grey)
                cell?.mIconWifiImageView.tintColor = UIColor(netHex: Colors.color_grey)
                
                ViewUtils.setVisibility(view: (cell?.mIconTvImageView)!, visibility: .VISIBLE)
                ViewUtils.setVisibility(view: (cell?.mIconWifiImageView)!, visibility: .VISIBLE)
                
                ViewUtils.setVisibility(view: (cell?.mIconPhoneImageView)!, visibility: .GONE)
                ViewUtils.setVisibility(view: (cell?.mIconPlusSeconfImageView)!, visibility: .GONE)
            }else{
                cell?.mTitlePlanLabel.textColor = UIColor(netHex: Colors.color_white)
                cell?.mTitlePlanLabel.text = item.nameFamily
                
                cell?.mIconPhoneImageView.image = cell?.mIconPhoneImageView.image?.withRenderingMode(.alwaysTemplate)
                cell?.mIconTvImageView.image = cell?.mIconTvImageView.image?.withRenderingMode(.alwaysTemplate)
                cell?.mIconWifiImageView.image = cell?.mIconWifiImageView.image?.withRenderingMode(.alwaysTemplate)

                cell?.mIconPhoneImageView.tintColor = UIColor(netHex: Colors.color_grey)
                cell?.mIconTvImageView.tintColor = UIColor(netHex: Colors.color_grey)
                cell?.mIconWifiImageView.tintColor = UIColor(netHex: Colors.color_grey)

                ViewUtils.setVisibility(view: (cell?.mIconPhoneImageView)!, visibility: .VISIBLE)
                ViewUtils.setVisibility(view: (cell?.mIconTvImageView)!, visibility: .VISIBLE)
                ViewUtils.setVisibility(view: (cell?.mIconWifiImageView)!, visibility: .VISIBLE)

            }
        }
        
        return cell!
    }
 
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arrFamily[indexPath.row]
        self.clickTableViewDelegate?.onItemClick(item: item.arrPlan)
    }
    
}
