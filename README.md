# 🖐️ Hand Gesture Volume Controller

Control your Android phone’s volume using your hand gestures — no buttons needed!  
This Flutter package works with a small Python server that reads your hand movements from a webcam and updates the volume on your phone in real-time.

---

## 📽️ Demo

https://youtu.be/YOUR_SCREEN_RECORDING_LINK  
(*Add your video recording here after uploading to YouTube or GitHub*)

---

## 🔧 What You Need

- A **Windows PC or laptop** with a webcam
- Your **Android phone** connected to the **same Wi-Fi**
- Python 3.8 or later
- Flutter 3.x

---

## 🚀 How It Works

1. Python code runs on your computer and uses your webcam to detect hand gestures.
2. It sends the volume level over your Wi-Fi.
3. Your Flutter app receives that volume level and applies it on your phone.

---

## 📦 How to Use

### Step 1: Clone This Package

git clone https://github.com/ZyadWKhedr/hand_gesture_volume_controller

cd hand_gesture_volume_controller

### Step 2: Run the Python Server
Open a terminal inside the server/ folder.

Install the required Python packages:

pip install flask opencv-python mediapipe numpy
Run the server:

python hand_control_server.py

- If everything works, it will say:

Running on http://192.168.xx.xx:5000
👉 Copy that IP address — you’ll use it in the Flutter app!

### Step 3: Open the Flutter Example App
Open the example/ folder in VS Code.

In main.dart, set your local server IP like this:

final controller = GestureVolumeController(
  serverUrl: 'http://192.168.xx.xx:5000/volume-data',
);
Run the app:

flutter run
You’ll see a volume level on your phone screen that changes when you move your fingers 👌

### ✋ Supported Gestures
1. 📏 Distance between your thumb and index controls the volume

2. 🤏 If they touch, the system mutes

3. 🟢 Volume bar is displayed in real time


### 🤝 Contribute or Fork
Want to help? You can:

Add more gestures (pause, swipe, next/prev)

Improve UI

Help port to iOS (if possible)

### 📜 License
MIT © 2025 Zyad
Made using Flutter, Python, and MediaPipe

