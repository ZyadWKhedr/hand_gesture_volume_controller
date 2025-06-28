# hand_control_server.py

from flask import Flask, jsonify
import cv2
import mediapipe as mp
import numpy as np
import math
import threading

app = Flask(__name__)
volume_percent = 0
lock = threading.Lock()

mp_hands = mp.solutions.hands
hands = mp_hands.Hands(max_num_hands=1)
cap = cv2.VideoCapture(0)

def detect_hand_volume():
    global volume_percent
    while True:
        success, img = cap.read()
        if not success:
            continue

        img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        results = hands.process(img_rgb)

        if results.multi_hand_landmarks:
            hand = results.multi_hand_landmarks[0]
            h, w, _ = img.shape
            lm = hand.landmark
            x1, y1 = int(lm[4].x * w), int(lm[4].y * h)
            x2, y2 = int(lm[8].x * w), int(lm[8].y * h)
            length = math.hypot(x2 - x1, y2 - y1)
            vol = np.interp(length, [50, 300], [0, 100])

            with lock:
                volume_percent = 0 if length < 50 else int(vol)

def run_thread():
    thread = threading.Thread(target=detect_hand_volume, daemon=True)
    thread.start()

@app.route('/volume-data')
def get_volume():
    with lock:
        return jsonify({"volume_percent": volume_percent})

if __name__ == '__main__':
    run_thread()
    app.run(host='0.0.0.0', port=5000)
