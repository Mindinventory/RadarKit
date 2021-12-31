//
//  User.swift
//
//  Created by Parth Gohel on 29/12/21.
//

import Foundation

public struct User {
    public let id: UUID
    public let profileImage: String
    
    public init(id: UUID, profileImage: String) {
        self.id = id
        self.profileImage = profileImage
    }
}
