//
//  HTTPError.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 25.06.21.
//

import Foundation

enum GithubWebServiceError: Error {
    case network(description: String)
    case parsing(description: String)
}
