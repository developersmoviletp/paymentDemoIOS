//
//  CarruselDataSource.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez Villa on 07/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import moa

protocol CarruselDataDelegate: NSObjectProtocol {
    func onItemClick(planSelected: Plans)
    
    func onChangeItem(planDetail: String, planName: String)
}

public class CarruselDataSource: NSObject, iCarouselDataSource, iCarouselDelegate {
    
    
    var mICarousel: iCarousel
    var mItems : [Plans] = []
    var mSelectedIndex : Int = 0
    var mCarruselDataDelegate : CarruselDataDelegate?
    
    
    init(carrusel : iCarousel, mCarruselDataDelegate: CarruselDataDelegate){
        mICarousel = carrusel
        self.mCarruselDataDelegate = mCarruselDataDelegate
    }
    
    func settings(){
        mICarousel.type = iCarouselType.linear
        mICarousel.delegate = self
        mICarousel.dataSource = self
    }
    
    func update(items : [Plans]){
        mItems = items
        mICarousel.reloadData()
    }
    
    public func numberOfItems(in carousel: iCarousel) -> Int {
        return mItems.count
    }
    
    public func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = Bundle.main.loadNibNamed("ItemPackageCollectionReusableView", owner: self, options: nil)![0] as! ItemPackageCollectionReusableView
        view.typePackageImageView.moa.onSuccess = { image in
            return image
        }
        view.typePackageImageView.moa.onError = { error, response in
            // Handle error
        }
        
        if((mItems[index].imPlan != nil)){
            view.typePackageImageView.moa.url = mItems[index].imPlan!
        }
        
        return view
    }
    
    public func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        mSelectedIndex = index
        mCarruselDataDelegate?.onItemClick(planSelected: mItems[mSelectedIndex])
    }
    
    public func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        if mItems.count > 0 {
            mSelectedIndex = carousel.currentItemIndex
            
            let item = mItems[mSelectedIndex]
            let planDetail = item.planDetail != nil ? item.planDetail : ""
            let planName = item.planName != nil ? item.planName : ""
            mCarruselDataDelegate?.onChangeItem(planDetail: planDetail!, planName: planName!)
        }
    }

}
