//
//  ServiceAddOnDataSource.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 04/07/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import Foundation
import UIKit


public class ServiceAddOnDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    var tableView: UITableView?
    var addOnArray : [AddOn] = []
    
    init(tableView:UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource=self
        self.tableView?.delegate = self
        self.tableView?.estimatedRowHeight = 49
        self.tableView?.rowHeight = UITableViewAutomaticDimension
    }
    
    func update(coleccionInfo: [AddOn]){
        self.addOnArray = coleccionInfo
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addOnArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ItemPagoTableViewCell"
        
        let cell:ItemPagoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier, for:indexPath)as! ItemPagoTableViewCell
        
        let addOn = self.addOnArray[indexPath.row]
        
        cell.serviceAddOnLabel.text = addOn.nameAddOn
        cell.priceLabel.text = addOn.price
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 49.0;//Choose your custom row height
    }
    
   
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red
    }
    
    // if tableView is set in attribute inspector with selection to multiple Selection it should work.
    
    // Just set it back in deselect
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath as IndexPath)!
        //cellToDeSelect.contentView.backgroundColor = UIColor(netHex: 0x5D758F)
    }
    
    
}

