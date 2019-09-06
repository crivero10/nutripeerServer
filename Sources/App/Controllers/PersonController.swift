//
//  PersonController.swift
//  App
//
//  Created by master on 27/08/19.
//

import Foundation

import Foundation
import Vapor

struct UserByHashcodeRequest: Content{
    var hashcode : String
}

final class PersonController {
    func index(_ req: Request) throws -> Future<[Person]> {
        return Person.query(on: req).all()
    }
    
    func userByHash(_ req: Request) throws -> Future<HTTPStatus>{
        return try! req.content.decode(UserByHashcodeRequest.self).map(to: HTTPStatus.self) { ubhreq in
            print(ubhreq.hashcode)
            return .ok
        }
        
        
    }
    
    func create(_ req: Request) throws -> Future<Person> {
        return try req.content.decode(Person.self).flatMap { person in
            return person.save(on: req)
        }
    }
}
