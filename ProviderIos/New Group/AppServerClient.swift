//
//  AppServerClient.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum Result<T, U> where U: Error {
    case success(payload: T)
    case failure(U?)
}

// MARK: - AppServerClient
class AppServerClient {
    
    // MARK: - GetFriends
    enum GetFriendsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetFriendsResult = Result<[User], GetFriendsFailureReason>
    typealias GetFriendsCompletion = (_ result: GetFriendsResult) -> Void
    
    func getFriends(completion: @escaping GetFriendsCompletion) {
        Alamofire.request("http://friendservice.herokuapp.com/listFriends")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let jsonArray = response.result.value as? [JSON] else {
                        completion(.failure(nil))
                        return
                    }
                    completion(.success(payload: jsonArray.compactMap { User(json: $0 ) }))
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetFriendsFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
}
