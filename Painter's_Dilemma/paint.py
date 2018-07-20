# VICTOR FIGUEIREDO
# https://csacademy.com/ieeextreme-practice/task/painters-dilemma/

import numpy as np
t = input()

def refresh (c):
    c_count = [0]*20
    for i in c:
        c_count[i]+=1
    return np.array(c_count)

for i in range(t):
    N = input()
    c = raw_input()
    c=c.split(" ")
    c = np.array(c).astype(int)

    p1 = 0
    p2 = 0


    changes = 1
    p1 = c[0]
    np.delete(c,0)
    copy = np.copy(c)

    for color in c:
        c_count = refresh(copy)
        if p1 == color or p2==color:
            pass
        elif (p1 != color) and (p2 != color) :
            if c_count[p1]>c_count[p2]:
                p2 = color
                changes+=1
            elif c_count[p1]<c_count[p2]:
                p1 = color
                changes+=1
            else:
                for a in copy:
                    if a == p1:
                        p2=color
                        changes+=1
                        break
                    elif a == p2:
                        p1=color
                        changes+=1
                        break


        copy = np.delete(copy,0)
    print(changes)
