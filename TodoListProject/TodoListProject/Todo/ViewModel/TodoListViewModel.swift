//
//  TodoListViewModel.swift
//  TodoListProject
//
//  Created by Junhee Lee on 8/29/24.
//

import Foundation
import CoreData

class TodoListViewModel: ObservableObject {
    @Published var todoItem: [TodoModel] = []
    @Published var isPresented: Bool = false
    
    func addItem(title: String) {
        let itemToAdd = TodoModel(title: title)
        todoItem.append(itemToAdd)
    }
    
    func removeItem(at indexsets: IndexSet) {
        todoItem.remove(atOffsets: indexsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        todoItem.move(fromOffsets: source, toOffset: destination)
    }
    
    func toggleItem(item: TodoModel) {
        if let idx = todoItem.firstIndex(where: {
            (originalItem) -> Bool in
            return originalItem.id == item.id
        }) {
            todoItem[idx].isComplete.toggle()
        }
    }
}
