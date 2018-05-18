//
//  ListItem.swift
//  Projet_swift
//
//  Created by Developer on 17/05/2018.
//  Copyright © 2018 Nicolas Depero. All rights reserved.
//

import Foundation
class ListItem {
    var items: [Item]
    var allItems: [Item] {
        return items
    }
    
    init(){
        items = []
        read()
    }
    
    func add (_ item:Item) {
        items.append(item)
        save()
    }
    
    func remove(_ item: Item) {
        //if let index = items.index(of: item) {
        //    items.remove(at: index)
        //}
    }
    
    func save(){
        let encoder = JSONEncoder()
        let data = try? encoder.encode(items)
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("Robot").appendingPathExtension("json")
        try? data?.write(to: archiveURL)
    }
    
    func read(){
        let decoder = JSONDecoder()
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentDirectory.appendingPathComponent("Robot").appendingPathExtension("json")
        if let retrievedData = try? Data(contentsOf: archiveURL),
            let decodedRobots = try? decoder.decode(Array<Item>.self, from: retrievedData){
            items = decodedRobots
        }
    }
}



