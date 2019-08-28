//
//  Messenger.swift
//  App
//
//  Created by master on 26/08/19.
//

import Foundation

import FluentMySQL
import Vapor

/// A simple user.
final class Messenger: MySQLModel {
    var id: Int?
    

    /// The user's full name.
    var name: String

    /// The user's current age in years.
    var age: Int

    /// Creates a new user.
    init(id: Int? = nil, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}

extension Messenger: Content { }
extension Messenger: MySQLMigration { }
