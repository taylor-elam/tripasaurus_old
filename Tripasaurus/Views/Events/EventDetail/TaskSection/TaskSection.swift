import SwiftUI

struct TaskSection: View {
    @Binding var tasks: [EventTask]
    @FocusState var focusedTask: EventTask?

    func addTask() {
        let newTask = EventTask(title: "")
        tasks.append(newTask)
        focusedTask = newTask
    }

    var body: some View {
        List {
            Section(content: {
                ForEach($tasks.filter { !$0.isDeleted.wrappedValue }) { $task in
                    TaskRow(task: $task)
                        .swipeActions {
                            Button(role: .destructive, action: { task.isDeleted = true }, label: { Label("Delete", systemImage: "trash") })
                        }
                }
                Button(action: addTask, label: { Label("Add Task", systemImage: "plus") })
                    .disabled(!tasks.allSatisfy { !$0.title.isEmpty })
                    .padding(.horizontal, -4)
            }, header: {
                Text("Tasks").sectionHeaderStyle()
            })
        }
    }
}

struct TaskSection_Previews: PreviewProvider {
    static var previews: some View {
        TaskSection(tasks: .constant(Event.example.tasks))
            .background(Color(UIColor.secondarySystemBackground))
            .previewLayout(.sizeThatFits)
    }
}
