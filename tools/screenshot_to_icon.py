import cv2 as cv
import numpy as np
from os import listdir
from os.path import isfile, join

def eqC(c,r, t=100):
    return abs(c[0]-r[0]) < t and abs(c[1]-r[1]) < t and abs(c[2]-r[2]) < t


def work(path, f):
    img = cv.imread(join(path, f))

    new = np.empty((np.size(img, 0), np.size(img, 1), 4), np.uint8)

    cv.cvtColor(img, cv.COLOR_BGR2BGRA, new)

    xmin = 10000
    ymin = 10000
    xmax = 0
    ymax = 0

    for y in range(np.size(img, 0)):
        for x in range(np.size(img, 1)):
            if eqC(img[y, x, :], [0, 255, 0]):
                new[y, x, :] = [0, 0, 0, 0]
            else:
                if x < xmin:
                    xmin = x
                if x > xmax:
                    xmax = x
                if y < ymin:
                    ymin = y
                if y > ymax:
                    ymax = y

    #print(xmin, ymin, xmax, ymax)

    xdif = xmax - xmin
    ydif = ymax - ymin

    if xdif > ydif:
        xfrom = xmin
        xto = xmax

        difdif = (xdif - ydif) // 2

        yfrom = ymin - difdif
        yto = ymax + difdif
    else:
        yfrom = ymin
        yto = ymax

        difdif = (ydif - xdif) // 2

        xfrom = xmin - difdif
        xto = xmax + difdif

    frame = 10
    size = 128

    crop_img = new[yfrom - frame:yto + frame, xfrom - frame:xto + frame]

    resize = np.empty((size, size, 4), np.uint8)

    cv.resize(crop_img, (size, size), resize)

    #cv.imshow("a", resize)

    #cv.waitKey(0)

    cv.imwrite(join(r"C:\Users\Bloodwyn\Documents\Arma 3\Screenshots\done", f), resize)


path = r"C:\Users\Bloodwyn\Documents\Arma 3\Screenshots"

onlyfiles = [f for f in listdir(path) if isfile(join(path, f))]

for f in onlyfiles:
    work(path,f)
    print(f,"done")