//
//  TodoModel.swift
//  TodoListProject
//
//  Created by Junhee Lee on 8/27/24.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isComplete: Bool = false
}

//extension TodoModel {
//    static var MOCK_DATA: [TodoModel] {
//        get {
//            return [
//                TodoModel(title: "iOS App Dev"),
//                TodoModel(title: "달리기 10km 뛰기"),
//                TodoModel(title: "개발 서적 완독하기", isComplete: true)
//            ]
//        }
//    }
//}  
