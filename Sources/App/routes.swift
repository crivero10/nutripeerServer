import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req -> String in
        if let name = try? req.query.get(String.self, at:"name"){
            return name
        }
        else{
            return "No params"
        }
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let personController = PersonController()
    
    router.post("person", use: personController.create)
    
}
