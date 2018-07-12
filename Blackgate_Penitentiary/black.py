# Victor Figueiredo
# https://csacademy.com/ieeextreme-practice/task/8761fb7efefcf1d890df1d8d91cae241/

num1 = input()
num1 = int(num1)
dic = {}
for i in range(num1):

    line = raw_input()
    line = line.split(" ")

    if dic.has_key(line[1]):

        x = dic[line[1]]
        x.append(line[0])
        dic[line[1]] = x
    else:

        aux = []
        aux.append(line[0])
        dic[line[1]] = aux


keys = sorted(dic)
old = 0
for chave in keys:
    nomes = ""
    ln = 0
    lst = dic[chave]
    lst = sorted(lst)
    for i in lst:
        nomes = nomes + " " + i
        ln+=1
    print ('{} {} {}'.format(nomes, old+1, old +ln))
    old = ln + old
