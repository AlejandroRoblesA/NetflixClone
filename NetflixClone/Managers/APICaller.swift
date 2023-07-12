//
//  APICaller.swift
//  NetflixClone
//
//  Created by Alejandro Robles on 03/07/23.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

struct Constants {
    static let API_KEY = "f7918a8e9f0abc2ebf4f18ba417255d5"
    static let baseUrl = "https://api.themoviedb.org"
    static let YouTubeAPI_Key = "AIzaSyDM6bfdHdKRP7kiRlPFxEggc-VnsUzHSeA"
    static let YouTubeBaseUrl = "https://www.googleapis.com/youtube/v3/search?"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.API_KEY)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)")
        else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error  == nil else { return }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.YouTubeBaseUrl)q=\(query)&key=\(Constants.YouTubeAPI_Key)") else { return }
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
