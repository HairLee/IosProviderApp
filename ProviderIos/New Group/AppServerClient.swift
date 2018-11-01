//
//  AppServerClient.swift
//  Friends
//
//  Created by Jussi Suojanen on 07/11/16.
//  Copyright © 2016 Jimmy. All rights reserved.
//

import Alamofire

// MARK: - AppServerClient
class AppServerClient {
    
    
    
    // MARK: - Login
    // MARK: - PostFriend
    enum PostLoginFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias PostLoginResult = EmptyResult<PostLoginFailureReason>
    typealias PostLoginCompletion = (_ result: PostLoginResult) -> Void
    
    func postLogin(username: String, password: String, type: String, completion: @escaping PostLoginCompletion) {
        let param:[String:Any] = ["account": username,
                     "password": password,
                     "type": 1]
        Alamofire.request("http://35.187.243.177/auth/api/login", method: .post, parameters: param, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
//                    do {
//                        guard let data = response.data else {
//                            completion(.failure(nil))
//                            return
//                        }
//
////                        let friends = try JSONDecoder().decode([Friend].self, from: data)
////                        completion(.success(payload: friends))
//                    } catch {
//                        completion(.failure(nil))
//                    }
                    completion(.success)
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = PostLoginFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
    // MARK: - GetFriends
    enum GetFriendsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetFriendsResult = Result<[Friend], GetFriendsFailureReason>
    typealias GetFriendsCompletion = (_ result: GetFriendsResult) -> Void
    
    func getFriends(completion: @escaping GetFriendsCompletion) {
        Alamofire.request("http://friendservice.herokuapp.com/listFriends")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(nil))
                            return
                        }
                        
                        let friends = try JSONDecoder().decode([Friend].self, from: data)
                        completion(.success(payload: friends))
                    } catch {
                        completion(.failure(nil))
                    }
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetFriendsFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
    // MARK: - PostFriend
    enum PostFriendFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias PostFriendResult = EmptyResult<PostFriendFailureReason>
    typealias PostFriendCompletion = (_ result: PostFriendResult) -> Void
    
    func postFriend(firstname: String, lastname: String, phonenumber: String, completion: @escaping PostFriendCompletion) {
        let param = ["firstname": firstname,
                     "lastname": lastname,
                     "phonenumber": phonenumber]
        Alamofire.request("https://friendservice.herokuapp.com/addFriend", method: .post, parameters: param, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(.success)
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = PostFriendFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
    // MARK: - PatchFriend
    enum PatchFriendFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias PatchFriendResult = Result<Friend, PatchFriendFailureReason>
    typealias PatchFriendCompletion = (_ result: PatchFriendResult) -> Void
    
    func patchFriend(firstname: String, lastname: String, phonenumber: String, id: Int, completion: @escaping PatchFriendCompletion) {
        let param = ["firstname": firstname,
                     "lastname": lastname,
                     "phonenumber": phonenumber]
        Alamofire.request("https://friendservice.herokuapp.com/editFriend/\(id)", method: .patch, parameters: param, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let data = response.data else {
                            completion(.failure(nil))
                            return
                        }
                        
                        let friend = try JSONDecoder().decode(Friend.self, from: data)
                        completion(.success(payload: friend))
                    } catch {
                        completion(.failure(nil))
                    }
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = PatchFriendFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
    // MARK: - DeleteFriend
    enum DeleteFriendFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias DeleteFriendResult = EmptyResult<DeleteFriendFailureReason>
    typealias DeleteFriendCompletion = (_ result: DeleteFriendResult) -> Void
    
    func deleteFriend(id: Int, completion: @escaping DeleteFriendCompletion) {
        Alamofire.request("https://friendservice.herokuapp.com/editFriend/\(id)", method: .delete, parameters: nil, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(.success)
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = DeleteFriendFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
    
}
