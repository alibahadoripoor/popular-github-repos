//
//  HTTPURLResponse + Extensions.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 26.06.21.
//

import Foundation

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}
