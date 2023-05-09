//
//  employee.swift
//  Api
//
//  Created by Денис Сторожев on 09.05.2023.
//

import Foundation

struct Employee : Decodable , Hashable{
    let id : Int
    let employee_name : String
    let employee_salary : Int
    
    
}

struct Query : Decodable {
    let status: String
    let data: [Employee]
}

extension Employee {
    static let  example =  Employee(id: 1, employee_name: "Ivan Karpov", employee_salary: 30000)
}

