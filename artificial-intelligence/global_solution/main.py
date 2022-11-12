# Icaro Figaro - RM 93571
# Cesar Norena - RM 95093
# Gustavo Jordao Santos - RM 93821

import os

import cv2
import urllib.request
import concurrent.futures
import cvlib as cv
import numpy as np
from cvlib.object_detection import draw_bbox

CAM_URL = 'http://xxxx/cam-hi.jpg'
# CAM_URL = 'http://192.168.0.157/cam-hi.jpg'
IMAGE = None


def beep():
    try:
        os.system("say beep")
    except:
        print("Beep")


def live_transmission():
    cv2.namedWindow("live transmission", cv2.WINDOW_AUTOSIZE)

    while True:
        camera_image = urllib.request.urlopen(CAM_URL)
        encoded_image = np.array(bytearray(camera_image.read()), dtype=np.uint8)

        IMAGE = cv2.imdecode(encoded_image, -1)
        cv2.imshow('live transmission', IMAGE)

        key = cv2.waitKey(5)
        if key == ord('q'):
            break

    cv2.destroyAllWindows()


def detect_on_image():
    cv2.namedWindow("detection", cv2.WINDOW_AUTOSIZE)

    while True:
        camera_image = urllib.request.urlopen(CAM_URL)
        encoded_image = np.array(bytearray(camera_image.read()), dtype=np.uint8)

        IMAGE = cv2.imdecode(encoded_image, -1)
        bbox, label, conf = cv.detect_common_objects(IMAGE, model='yolov4-tiny', enable_gpu=True)

        persons = 0
        for l, c in zip(label, conf):
            if l == 'person' and c >= 0.70:
                persons += 1

        if persons >= 2:
            beep()

        IMAGE = draw_bbox(IMAGE, bbox, label, conf)
        cv2.imshow('detection', IMAGE)

        key = cv2.waitKey(5)
        if key == ord('q'):
            break

    cv2.destroyAllWindows()


if __name__ == '__main__':
    with concurrent.futures.ProcessPoolExecutor() as executor:
        # f1 = executor.submit(live_transmission)
        f2 = executor.submit(detect_on_image)
