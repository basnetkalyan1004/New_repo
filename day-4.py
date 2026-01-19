while True:
    print("-------------menu-----------")
    print('1.Add task')
    print('2.List tasks')
    print('3.Edit task')
    print('4.Delete task')
    print('5.Exit program')
    print("-------------menu-----------")
    print()
    task_details=[]
    user_input=int(input(':>:Choose Operation:>:'))
    if user_input==1:
        task=input("Enter Task details:")
        task_details.append(task)
    elif user_input==2:
        if task_details==[]:
            print("First add some task!! No task present in this moment!!")
        else:
            for task_details in task_details:
                task=input("Select list:")
    