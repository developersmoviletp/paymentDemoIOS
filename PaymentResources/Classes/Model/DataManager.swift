//
//  DataManager.swift
//  EstrategiaDigital
//
//  Created by Jorge Hdez VIlla on 19/09/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import RealmSwift

public protocol TX : NSObjectProtocol {
    func execute(transactions : DataManager.Transactions)
}

public class DataManager : NSObject {
    
   public var mRealm : Realm?
   public var mTransactions : Transactions?
    
    public func getInstance() -> DataManager {
        if mRealm == nil {
            mRealm = try! Realm()
        }
        if mTransactions == nil{
            mTransactions = Transactions(mRealm: mRealm!)
        }
        
        return self
    }
    
    public func deleteFormalityEntity(){
        mRealm?.deleteAll()
    }
    
    public func queryWhere<T: Object>(object : T.Type) -> Query<T> {
        return Query<T>().create(object: object, mRealm: mRealm!)
    }
    
    public func tx(execute: (DataManager.Transactions) -> ()){
        try! mRealm?.write({ () -> Void in
            execute(mTransactions!)
        })
    }
    
    
    public class Query<T: Object> {
        
        var mRealm : Realm!
        var results : Results<T>!
        
      public  func create(object : T.Type, mRealm : Realm) -> Query {
            self.mRealm = mRealm
            results = mRealm.objects(object)
            return self
        }
        
       public func findFirst() -> T? {
            return results.first
        }
        
       public func list() -> [T] {
            return Array(results)
        }
        
       public func remove() {
            try! mRealm.write({ () -> Void in
                mRealm.delete(results)
            })
        }
        
    }
    
   public class Transactions : NSObject {
        
        public var mRealm : Realm!
        
        init(mRealm : Realm) {
            self.mRealm = mRealm
        }
        
     public   func save<T: Object>(object: T){
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
