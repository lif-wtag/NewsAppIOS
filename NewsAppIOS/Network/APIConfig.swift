//
//  APIConfig.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import Foundation

class APIConfig{
 
    static let shared = APIConfig() //singleton
    
    
    public init(){}
    
    public func getTopStories(completion: @escaping (Result<NewsResponse, Error>) ->Void){
        guard let url = Constants.topHeadlines else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            
            else if let data = data{
                do{
                    let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(result.self))
                    
                }catch{
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
        
    }
}
