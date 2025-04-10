# IOS_TodoList

### 프로젝트 정보

- 기간 : 24.08.27 - 24.09.05
- 인원 : 1인
- 간단 요약 : iOS 투두리스트 앱 개발해 할 일 생성, 삭제 기능 구현 
- 사용 기술 : Xcode, Swift

### 구체적 설명

Swift와 Xcode를 공부하면서 만들어본 MVVM 패턴을 활용한 간단한 To-do list 앱입니다. 

매일의 할 일을 추가하고 삭제할 수 있습니다. 

# 기능 설명

![0main](https://github.com/user-attachments/assets/8eebae7b-18ce-48e1-bd79-e1dc69d27e14)

메인 뷰인 TodoListView에서는 NavigationStack, VStack, List를 사용해 미완료와 완료 Section을 나누었습니다.

사용자가 "할일 만들기" Button을 누르면 TodoListViewModel의 isPresented 상태를 toggle합니다. 

이후 할 일을 추가할 수 있는 NewTodoListView modal 창이 띄워집니다.  

![1makeTodo](https://github.com/user-attachments/assets/5456063e-94da-47fb-a87f-2ae9d84722fa)

NewTodoListView는 VStack을 중첩해 Text, TextField, "완료" Button을 배치합니다.

Button을 눌렀을 때 TodoListViewModel의 isPresented 상태를 다시 toggle하고 TextField의 내용을 TodoListViewModel에 addItem 합니다. 

```swift
func addItem(title: String) {
    let itemToAdd = TodoModel(title: title)
    todoItem.append(itemToAdd)
}
```

![2makedTodo](https://github.com/user-attachments/assets/83b68f57-304a-4f1b-a5f6-4a6dc0ab45f1)

입력된 할 일은 메인 뷰의 미완료 Section에 추가됩니다. 

TodoListViewModel의 todoItem 배열을 ForEach를 통해 순회하는 방식으로 항목을 배치합니다. 

![3addTodos](https://github.com/user-attachments/assets/447af836-f865-46d9-be27-efcbcb56bbe0)

할 일 여러 개를 배치할 수 있습니다. 

![4finishedTodo](https://github.com/user-attachments/assets/2c5e3fc9-d537-4f79-ab70-c7865fffdee7)

각 항목의 우측 원을 누르면 toggleItem이 호출되어 isComplete 항목을 toggle합니다. 

```swift
func toggleItem(item: TodoModel) {
    if let idx = todoItem.firstIndex(where: {
        (originalItem) -> Bool in
        return originalItem.id == item.id
    }) {
        todoItem[idx].isComplete.toggle()
    }
}
```

메인 뷰의 ForEach가 순회할 때 해당 toggle 여부를 검사해 미완료와 완료 Section에 적절히 배치합니다. 

![5editTodos](https://github.com/user-attachments/assets/01a3b193-612b-46f7-a044-05c2f8b67f75)

Edit을 누르면 삭제 또는 이동할 수 있습니다. 

```swift
List{}
.onDelete(perform: viewModel.removeItem)
.onMove(perform: viewModel.moveItem)
```

![6doEdit](https://github.com/user-attachments/assets/02cff1d2-6d03-481d-93d7-32f963e832da)

좌측으로 드래그하면 항목을 삭제할 수 있습니다. 

# 디렉토리 구조

![8dir](https://github.com/user-attachments/assets/017edd15-5656-4397-80c8-36dca446124b)

- Root : Entry Point
- Main : ContentView에서 메인 뷰를 TodoListView로 정의
- Todo/View : TodoListView에서 뷰 정의, NewTodoListView에서 modal 뷰 정의
- Todo/ViewModel : TodoListViewModel에서 addItem, removeItem, moveItem, toggleItem 메소드 정의, PersistenceController에서 Core Data 설정 및 관리
- Model : TodoModel에서 할 일 객체 모델을 정의


  
