import os
arr = os.listdir()
for i in arr:
    if not ".py" in i:
        print("require \"user." + i[0:len(i)-4] + "\"")

