import math

def spiro():
    R = 36
    r = 9
    a = 30
    t = 0.00

    with open("spiro.txt", 'w') as f:
        while t < 12 * math.pi:
            x=((R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t))/8000 -118.2854468
            y = ((R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t))/8000 + 34.0205619
            res = str(x)+ ',' +str(y)+ ",0.0\n"
            f.write(res)
            t += 0.01

if __name__ == '__main__':
    spiro()
