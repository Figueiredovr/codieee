#Victor Figueiredo
#https://csacademy.com/ieeextreme-practice/task/59d4aae501fe4ced9ffbf3737acd18a2/
import numpy as np
line = raw_input()
n, m = line.split(" ")
# n = i = linhas
#m = j = colunas
matrix = []
n = int(n)
m = int(m)
# ============ lendo matriz ===========
for i in range(n):
    line = raw_input()
    matrix.append( np.array(line.split(" ")).astype(int)  )

matrix = np.array(matrix)

# Score - pontua as linhas e colunas da matriz
def score(array):
    score = 0 #pontuacao
    array_cp = np.copy(array)
    num = [0]*4 #lista com as distancia do multiplo de 3

    if(np.amax(array)>=12):
        return -99 #Nao pode ser maior que 12

    #verificando distancia para o proximo multiplo de 3
    for i in range(len(array_cp)):
        ele = array_cp[i]
        ele = int(ele/3)
        array_cp[i] = array_cp[i] - ele*3
        num[array_cp[i]] +=1


    if np.argmax(num)>0: #verificando se a distancia para o multiplo de 3 com maior frequencia nao eh 0
        score = np.amax(num)
    else:
        return 0


    return score


scr = np.array([0]*(n+m))


while True:

    for i in range(n):
        scr[i] = score(matrix[i,])
    for i in range(m):
        scr[n+i] = score(matrix[:,i])

    #print("Score:{}").format(scr)
    maxi = np.amax(scr)
    index =np.argmax(scr)
    #print(maxi)
    #print(index)

    if maxi<=0:
        break



    if index>= n:
        #Colunas
        matrix[:,index-n]+=1
    else:
        #Linhas
        matrix[index,]+=1


    #print(matrix)

#Calculando total
total = 0
for i in range(n):
    for j in range(m):
        if (matrix[i][j]%3 == 0):
            total+=1

#print("total:{} \n Matriz\n\n{}").format(total,matrix)
print(total)
