import SwiftUI

struct TaskSection: View {
    @Binding var tasks: [EventTask]
    @FocusState var focusedTask: EventTask?

    func addTask() {
        let newTask = EventTask()
        tasks.append(newTask)
        focusedTask = newTask
    }

    var body: some View {
        List {
            Section(content: {
                ForEach($tasks.filter { !$0.isDeleted.wrappedValue }) { $task in
                    TaskRow(task: $task)
                        .swipeActions { DeleteButton(action: { task.isDeleted = true }) }
                }
                Button(
                    action: addTask,
                    label: { Label(LocalizedStringKey(EventVault.taskAdd.name), systemImage: AppSymbol.addNew.name) }
                )
                .disabled(!tasks.allSatisfy { !$0.title.isEmpty })
                .padding(.horizontal, -4)
            }, header: {
                Text(LocalizedStringKey(EventVault.taskSectionTitle.name)).sectionHeaderStyle()
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
