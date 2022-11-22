//
//  User.swift
//  Homework_2.28_4_LoginApp_v2
//
//  Created by Ravil on 22.11.2022.
//

import Foundation

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getUser() -> User {
        User(login: "Tim88", password: "1qaz2wsx", person: Person.getPerson())
    }
}

struct Person {
    var name: String
    var surname: String
    var born: String
    var company: String
    var position: String
    var photo: String
    var biography: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Tim",
            surname: "Cook",
            born: "1960",
            company: "Apple",
            position: "CEO",
            photo: "timCook",
            biography: """
                Before being named CEO in August 2011, Tim was Apple’s chief operating officer and was responsible for all of the company’s worldwide sales and operations, including end-to-end management of Apple’s supply chain, sales activities, and service and support in all markets and countries. He also headed Apple’s Macintosh division and played a key role in the continued development of strategic reseller and supplier relationships, ensuring flexibility in response to an increasingly demanding marketplace.
                """
        )
    }
}
