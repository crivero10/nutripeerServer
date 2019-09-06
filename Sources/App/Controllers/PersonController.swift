//
//  PersonController.swift
//  App
//
//  Created by master on 27/08/19.
//

import Foundation

import Foundation
import Vapor
final class PersonController {
    func index(_ req: Request) throws -> Future<[Person]> {
        return Person.query(on: req).all()
    }
    
    func userByHash(_ req: Request) throws -> Future<Person>{
        let codeqrhash = req.json["hashcode"]
        return Person.query(on: req).filter(\.hashcode == codeqrhash)
    }
    
    func create(_ req: Request) throws -> Future<Person> {
        return try req.content.decode(Person.self).flatMap { person in
            return person.save(on: req)
        }
    }
}
