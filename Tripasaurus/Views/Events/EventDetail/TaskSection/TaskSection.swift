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
        VStack(alignment: .leading, spacing: 0) {
            Text("Tasks")
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(.secondary)

            VStack(alignment: .leading) {
                ForEach($tasks.filter { !$0.isDeleted.wrappedValue }) { $task in
                    TaskRow(task: $task)
                }
                Button { addTask() } label: { Label("Add Task", systemImage: "plus").padding(.horizontal) }
                    .disabled(!tasks.allSatisfy { !$0.title.isEmpty })
                    .buttonStyle(.borderless)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            .listCardStyle()
        }
        .padding(.horizontal)
    }
}

struct TaskSection_Previews: PreviewProvider {
    static var previews: some View {
        TaskSection(tasks: .constant(Event.example.tasks))
            .background(Color(UIColor.secondarySystemBackground))
            .previewLayout(.sizeThatFits)
    }
}
