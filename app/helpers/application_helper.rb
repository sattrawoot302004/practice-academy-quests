module ApplicationHelper
     def task_complete_class(task)
    "line-through text-gray-400" if task.completed
     end
end
