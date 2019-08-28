//
//  User.swift
//  App
//
//  Created by master on 26/08/19.
//


import FluentMySQL
import Vapor

/// A simple user.
final class User: MySQLModel {
    var id: Int?
    

    /// The user's full name.
    var namer: String

    /// The user's current age in years.
    var ages: Int

    /// Creates a new user.
    init(id: Int? = nil, name: String, age: Int) {
        self.id = id
        self.namer = name
        self.ages = age
    }
}

extension User: Content { }
extension User: MySQLMigration { }
