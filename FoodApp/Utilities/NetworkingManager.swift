//
//  NetworkingManager.swift
//  FoodApp
//
//  Created by A'zamjon Abdumuxtorov on 24/07/24.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkingError:LocalizedError{
        case badURLResponse(url:URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad responce from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url:URL)-> AnyPublisher<Data,Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0 , url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output,url:URL) throws-> Data{
        guard let responce = output.response as? HTTPURLResponse,
              responce.statusCode >= 200 && responce.statusCode <= 300 else {
            throw NetworkingError.badURLResponse(url:url)
        }
        return output.data
    }
    
    static func handleComplition(complition: Subscribers.Completion<Error>){
        switch complition{
        case.finished:
            break
        case.failure(let error):
            print(error.localizedDescription)
        }
    }
}

