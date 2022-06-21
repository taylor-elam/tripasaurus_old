import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask

    @FocusState var focusedTask: EventTask?

    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? AppSymbol.checkmarkCircle.name : AppSymbol.circle.name)
            }
            .buttonStyle(.plain)

            TextField(LocalizedStringKey(EventVault.taskDescription.name), text: $task.title)
                .focused($focusedTask, equals: task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: .constant(EventTask.example))
            .previewLayout(.sizeThatFits)
    }
}
