//
//  TransactionAPI.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import Alamofire
import SwiftyJSON
import RxSwift

class TransactionAPI {
    
    private let URL: String = "http://demo0569565.mockable.io" //Maybe put this into a different class?
    private let session = URLSession.shared
    
    static let shared = TransactionAPI()
    
    private init() {}
    
    func getAllTransactions() -> Observable<JSON> {
        return Observable<JSON>.create({ (observer) -> Disposable in
            let requestRef = Alamofire.request("\(self.URL)/transactions").responseJSON { response in
                if let json = response.result.value {
                    let items = JSON(json)["items"]
                    items.forEach({ (item) in
                        observer.onNext(item.1)
                    })
                    observer.onCompleted()
                } else if let error = response.result.error {
                    observer.onError(error)
                }
            }
            return Disposables.create {
                requestRef.cancel()
            }
        })
    }
    
    func getTransactionDetail(id: Int) -> Observable<JSON> {
        return Observable<JSON>.create({ (observer) -> Disposable in
            let requestRef = Alamofire.request("\(self.URL)/transactions/\(id)").responseJSON { response in
                if let json = response.result.value {
                    observer.onNext(JSON(json)["contraAccount"])
                    observer.onCompleted()
                } else if let error = response.result.error {
                    observer.onError(error)
                }
            }
            return Disposables.create {
                requestRef.cancel()
            }
        })
    }
}
