//
//  DataManager.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 19/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import RealmSwift

protocol TX : NSObjectProtocol {
    func execute(transactions : DataManager.Transactions)
}

public class DataManager : NSObject {
    
    var mRealm : Realm?
    var mTransactions : Transactions?
    
    func getInstance() -> DataManager {
        if mRealm == nil {
            mRealm = try! Realm()
        }
        if mTransactions == nil{
            mTransactions = Transactions(mRealm: mRealm!)
        }
        
        return self
    }
    
    func deleteFormalityEntity(){
//        let objects = mRealm?.objects(FormalityEntity.self)
//        mRealm?.delete(objects!)
        mRealm?.deleteAll()
    }
    
    func queryWhere<T: Object>(object : T.Type) -> Query<T> {
        return Query<T>().create(object: object, mRealm: mRealm!)
    }
    
    func tx(execute: (DataManager.Transactions) -> ()){
        try! mRealm?.write({ () -> Void in
            execute(mTransactions!)
        })
    }
    
    
    class Query<T: Object> {
        
        var mRealm : Realm!
        var results : Results<T>!
        
        func create(object : T.Type, mRealm : Realm) -> Query {
            self.mRealm = mRealm
            results = mRealm.objects(object)
            return self
        }
        
        func findFirst() -> T? {
            return results.first
        }
        
        func list() -> [T] {
            return Array(results)
        }
        
        func remove() {
            try! mRealm.write({ () -> Void in
                mRealm.delete(results)
            })
        }
        
    }
    
    class Transactions : NSObject {
        
        var mRealm : Realm!
        
        init(mRealm : Realm) {
            self.mRealm = mRealm
        }
        
        func save<T: Object>(object: T){
            mRealm.add(object, update: true)
        }
    }
    
//    func insert<T: Object>(object: T) -> T!{
//        let realm = try! Realm()
//        realm.beginWrite()
//        realm.add(object, update: true)
//        try! realm.commitWrite()
//        return object
//    }

}
