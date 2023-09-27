//
//  ApiMethodDescribing.swift
//  CinemaRoulette
//
//  Created by Евгений Испольнов on 28.09.2023.
//

import Foundation

public protocol ApiMethodDescribing {
    
    var version: String? { get }
    var method: String { get }
    var parameters: String { get }
    
}

extension ApiMethodDescribing {
    
    var urlString: String {
        if let version = version {
            return "https://kinopoiskapiunofficial.tech/api" + "/v\(version)/" + method
        } else {
            return "https://kinopoiskapiunofficial.tech/api" + "/" + method
        }
    }
    
}
