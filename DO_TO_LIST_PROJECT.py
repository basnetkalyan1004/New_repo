task_details=[]
length=len(task_details)
while True:
    try:
        while True:
            print("-------------menu-----------")
            print('1.Add task')         
            print('2.View tasks')       
            print('3.Edit task')
            print('4.Delete task')
            print('5.Exit program')
            print("-------------menu-----------")
            print()
            user_input=int(input(':>:Choose Operation:>:'))
            if user_input==1:
                while True:                              #this option will add task in list.
                    task=input("Enter Task details:")
                    task_details.append(task)
                    print("ADDED SUCESSFULY!")
                    validation=input("Do You Want To Add More?(y/n):").lower()
                    if validation=='y':
                        pass
                    else:
                        break
            elif user_input==2:                             #this option will view list of task avaible in list 
                while True:
                    if task_details==[]:
                        print("No Task Available Currently!")
                        break
                    else:
                        n=1
                        for i in task_details:
                            print(f'{n}.{i}')
                            n+=1
                        validation=input("Done seeing?(y/n)").lower()
                        if validation=='y':
                            break
                        else:
                            pass
            elif user_input==3:         #THIS CODE<BLOCK> IS TO EDIT TASK*
                while True:
                    n=1
                    for i in task_details:
                        print(f'{n}.{i}')
                        n+=1
                    selection=int(input("Enter The Task For Manupulation:>: "))
                    selection=selection-1
                    if selection > length:
                            print("You Have Entered OverNumber Than Actual")
                            validation=input("exit?(y/n):")
                            if validation=="y":
                                break
                    else:
                            new_task=input("EDIT WHITH>>")
                            task_details[selection]=new_task
                            print("Task Edited Sucessfuly!")
                            break
            elif user_input==4:         #THIS CODE<BLOCK> IS TO DELECT TASK
                while True:
                    n=1
                    for i in task_details:
                        print(f"{n}.{i}")
                        n+=1
                    selection=int(input("Select Task Number TO Delete::>: "))
                    selection=selection - 1
                    if selection > length:
                        print("You Have Entered OverNumber Than Actual")
                        validation=input("exit?(y/n):").lower()
                        if validation=="y":
                            break 
                    else:
                        del task_details[selection]
                        print("DELETED SUCESSFULY!")
                        validation=input("Return to The menu?(y/n):").lower()
                        if validation=='y':
                                break
            elif user_input==5: #THIS CODE<BLOCK> IS TO EXIT FROM PROGRAM
                break
            else:
                while True:
                    print("Select from 1 to 5")
                    validation=input("Do you understand?(yes/no):").lower()
                    if validation=='yes':
                        break
                    else:
                        print("just yes or no")
    except ValueError:
        print(" Re-try with valid Number")
    except TypeError:
        print("IN_VALID TASK NUMBER:")
    except IndexError:
        print("ADD TASK FIRST TO PERFORME OPERATIONS OR THIS RANGE OF OPERATION ISN'T PRESENT")