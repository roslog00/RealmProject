//
//  Model.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//


import Foundation
import RealmSwift


final class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
    
}
