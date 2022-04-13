//
//  NetworkManager.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 8/4/22.
//

import Foundation
import Alamofire

class NetworkManager {
    var baseUrl = "https://www.reddit.com/r/chile/new/.json?limit=100"
    
    func getPosts(completionClosure: @escaping (PostsResponse?, String) -> (), errorClosure: @escaping ((Error) -> ())) {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(baseUrl, method: .get, encoding: JSONEncoding.default, headers: headers){ request in
            request.timeoutInterval = 60
        }.response { response in
            if let status = response.response?.statusCode {
                switch status {
                case 200:
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode(PostsResponse.self, from: data)
                        DispatchQueue.main.async {
                            completionClosure(posts, "")
                        }
                    } catch let error {
                        errorClosure(error)
                    }
                default:
                    completionClosure(nil, "Status code: \(status)")
                }
            }
        }
    }
    
    func searchPosts(query: String, completionClosure: @escaping (PostsResponse?, String) -> ()) {
        let baseUrl = URL(string:"https://www.reddit.com/r/chile/search.json?q=\(query.replacingOccurrences(of: " ", with: "%20")))&limit=100")!
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(baseUrl, method: .get, encoding: JSONEncoding.default, headers: headers){ request in
            request.timeoutInterval = 60
        }.response { response in
            if let status = response.response?.statusCode {
                switch status {
                case 200:
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    do {
                        let posts = try decoder.decode(PostsResponse.self, from: data)
                        DispatchQueue.main.async {
                            completionClosure(posts, "")
                        }
                    } catch let error {
                        print("Error: \(error.localizedDescription)")
                    }
                default:
                    completionClosure(nil, "Status code: \(status)")
                }
            }
        }
    }
    
}

