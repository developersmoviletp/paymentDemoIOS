//
//  CardsCarruselDataSource.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 13/08/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit

public class CardsCarruselDataSource: NSObject, iCarouselDataSource, iCarouselDelegate {
    
    var cards : [Card] = []
    var selectedCardItem : Card!
    var carrusel : iCarousel!
    var delegate : CardsCarruselDelegate!
    
    init(carrusel: iCarousel, delegate: CardsCarruselDelegate){
        self.carrusel = carrusel
        self.delegate = delegate
    }
    
    func update(cards : [Card]) {
        self.cards = cards
        if cards.count > 0 {
            selectedCardItem = cards[0]
        }
        self.carrusel?.reloadData()
//        self.carrusel?.contentOffset = CGSize(width: 0, height: 0)
        self.carrusel.scroll(toOffset: 0, duration: 0.5)
    }
    
    func settings(){
        carrusel.type = iCarouselType.linear
        carrusel.delegate = self
        carrusel.dataSource = self
    }
    
    public func numberOfItems(in carousel: iCarousel) -> Int{
        return cards.count + 1
    }
    
    public func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var view : UIView?
        if index == cards.count {
            view = Bundle.main.loadNibNamed("ItemAddCardCollectionReusableView", owner: self, options: nil)![0] as! ItemAddCardCollectionReusableView
        } else {
            view = Bundle.main.loadNibNamed("ItemTypeCardCollectionReusableView", owner: self, options: nil)![0] as! ItemTypeCardCollectionReusableView
            let carView : ItemTypeCardCollectionReusableView = view as! ItemTypeCardCollectionReusableView
            let item : Card = cards[index]
            carView.numberCardLabel.text = NSString(format: "Tarjeta ... %@", NSString(format: "%@", item.cardNumber).substring(from: 1)) as String
            if item.ccType != "" {
                if item.ccType == CardsEnum.VISA {
                    carView.typeTarjetImageView.image = UIImage(named: "ic_visa_card")
                } else if item.ccType == CardsEnum.MASTER_CARD {
                    carView.typeTarjetImageView.image = UIImage(named: "ic_mastercard_card")
                }
            } else {
                carView.typeTarjetImageView.image = nil
            }
        }
        return view!
    }
    
    public func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        if index == cards.count {
            delegate.onItemAddNewCardClick()
        } else {
            delegate.onItemCardClick()
        }
    }
    
    public func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        if carousel.currentItemIndex != cards.count  {
            selectedCardItem = cards[carousel.currentItemIndex]
        } else {
            selectedCardItem = nil
        }
    }

}
