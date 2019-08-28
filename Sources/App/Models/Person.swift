//
//  Person.swift
//  App
//
//  Created by master on 27/08/19.
//

import Foundation

import FluentMySQL
import Vapor

/// A simple user.
final class Person: MySQLModel {
    var id: Int?
    /// The user's full name.
    var firstName: String
    var lastName: String
    var dob: Date
    var sex: String
    var units: String
    var heightcm: Int
    var weightkg: Double
    var goal: String
    var activity: String
    var hashcode: String

    /// Creates a new user.
    init(id: Int? = nil, firstName: String,lastName: String,dob: Date,sex: String,units: String,heightcm: Int,weightkg: Double,goal: String,activity: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.sex = sex
        self.units = units
        self.heightcm = heightcm
        self.weightkg = weightkg
        self.goal = goal
        self.activity = activity
        self.hashcode = randomString(length: 24)
    }
    
    
}

extension Person: Content { }
extension Person: MySQLMigration { }

func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
