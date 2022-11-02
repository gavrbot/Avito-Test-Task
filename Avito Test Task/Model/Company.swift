//
//  Company.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 28.10.2022.
//

import Foundation

struct APIResponse: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employee]
}
