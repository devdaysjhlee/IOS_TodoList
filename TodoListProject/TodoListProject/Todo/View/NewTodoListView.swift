//
//  NewTodoListView.swift
//  TodoListProject
//
//  Created by Junhee Lee on 8/27/24.
//

import SwiftUI

struct NewTodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @State private var newTodoListTitle: String = ""
    
    var body: some View {
        VStack {
            Text("새로운 할일을 추가해보자")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            VStack(alignment: .leading) {
                Text("새로운 할일")
                    .font(.subheadline)
                    .foregroundStyle(Color(.systemGray2))
                    .padding(.top, 50)
                TextField("", text: $newTodoListTitle)
                    .frame(width: 280, height: 20)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.white))
                    .padding(.bottom)
            }
            Button("완료") {
                viewModel.addItem(title: newTodoListTitle)
                newTodoListTitle = ""
                viewModel.isPresented.toggle()
                
            }
            .frame(width: 200, height: 30)
            .padding()
            .foregroundStyle(.white)
            .background(Color(.systemRed))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(.systemGray6))
    }
}
//
//#Preview {
//    NewTodoListView(todoItem: $todoItem)
//}
