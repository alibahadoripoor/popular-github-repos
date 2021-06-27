//
//  HTTPError.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum HTTPError: Error {
    case network(description: String)
    case parsing(description: String)
    
    var des: String {
        switch self {
        case .network(let des):
            return "An error occurred while fetching data: " + des
        case .parsing(let des):
            return "An error occurred while decoding data: " + des
        }
    }
}




