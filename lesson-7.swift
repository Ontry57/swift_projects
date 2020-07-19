//
//  main.swift
//  lesson-7
//
//  Created by korolev-ap on 19.07.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import Foundation


enum DatabaseError: Error {            // ошибки автомата
    case tableDoesNotExist
    case tableAlreadyExist
}


protocol Database {
    var tables: [String] { get set }
    
    mutating func createTable(to tablename: String) -> (String?, DatabaseError?)
    mutating func dropTable(to tablename: String) throws -> (String?)
    
}

extension Database {
    
    mutating func createTable(to tablename: String) -> (String?, DatabaseError?) {
        guard (tables.firstIndex(of: tablename) == nil) else {
            return (nil, DatabaseError.tableAlreadyExist)
        }
        tables.append(tablename)
        return (tablename,nil)
    }
    
    mutating func dropTable(to tablename: String) throws -> (String?) {
        guard (tables.firstIndex(of: tablename) != nil) else {
            throw DatabaseError.tableDoesNotExist
        }
        tables.remove(at: tables.firstIndex(of: tablename)!)
        print("Таблица \(tablename) удалена")
        return (tablename)
    }
}

class myDatabase: Database {
    
    var tables = ["cx_appeals","cx_request","s_contact"]
    
    init(tables: [String] = ["cx_appeals","cx_request","s_contact"]) {
        self.tables = tables
    }
}


extension myDatabase: CustomStringConvertible {
    var description: String{
        get {
            return "\n\nСписок таблиц: \(tables)"
        }
    }
}
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

var database1 = myDatabase()
print(database1)
var tablename: String?

do {
    tablename = try database1.dropTable(to: "cx_request")
    print(database1)
    tablename = try database1.dropTable(to: "cx_request")
} catch DatabaseError.tableDoesNotExist {
    print("Таблицы не существует. Нечего удалять")
}


//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
//

var createTableTransact = database1.createTable(to: "cx_calls")

if let tablename = createTableTransact.0 {
    print("Мы создали таблицу: \(tablename)")
    print(database1)
} else if let error = createTableTransact.1 {
    print("Произошла ошибка: \(error.self) ")
    print(database1)
}


createTableTransact = database1.createTable(to: "cx_appeals")

if let tablename = createTableTransact.0 {
    print("Мы создали таблицу: \(tablename)")
} else if let error = createTableTransact.1 {
    print("Произошла ошибка: \(error.self) ")
    print(database1)
}
