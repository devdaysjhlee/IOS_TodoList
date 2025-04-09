//
//  TodoListView.swift
//  TodoListProject
//
//  Created by Junhee Lee on 8/27/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("미완료") {
                        ForEach(viewModel.todoItem) { item in
                            if !item.isComplete {
                                HStack {
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.toggleItem(item: item)
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                    Section("완료") {
                        ForEach($viewModel.todoItem) { $item in
                            if item.isComplete {
                                HStack {
                                    Text(item.title)
                                        .foregroundStyle(Color(.systemGray3))
                                        .strikethrough()
                                    Spacer()
                                    Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(.green)
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    viewModel.toggleItem(item: item)
                                }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                }
                .listStyle(PlainListStyle())
                Button("할일 만들기") {
                    viewModel.isPresented.toggle()
                }
                .frame(width: 200, height: 30)
                .padding()
                .foregroundStyle(.white)
                .background(Color(.systemRed))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .sheet(isPresented: $viewModel.isPresented) {
                    NewTodoListView(viewModel: viewModel)
                }
            }
            .navigationTitle("오늘 할일")
            .navigationBarItems(trailing: EditButton())
        }
        .padding()
    }
}

#Preview {
    TodoListView()
}
