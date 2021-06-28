//
//  Result.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 26.06.21.
//

import Foundation

enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}
