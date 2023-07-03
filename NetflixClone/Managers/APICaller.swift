//
//  APICaller.swift
//  NetflixClone
//
//  Created by Alejandro Robles on 03/07/23.
//

import Foundation

struct Constants {
    static let API_KEY = "f7918a8e9f0abc2ebf4f18ba417255d5"
    static let baseUrl = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/all/day?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
