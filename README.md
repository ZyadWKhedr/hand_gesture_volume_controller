# 🖐️ hand_gesture_volume_controller

Control your Android device’s volume in real-time using **hand gestures** — all powered by Flutter + Python + OpenCV + MediaPipe 🎛️

This package connects a Flutter app to a Python Flask server that detects hand gestures via webcam and translates them into system volume percentages.

> 🎥 **Demo:**  
> ![Demo Video](link-to-your-screen-recording.mp4)

---

## ✨ Features

✅ Real-time hand gesture tracking  
✅ Adjust system volume with thumb–index distance  
✅ Auto mute when fingers touch  
✅ Live volume bar on Flutter UI  
✅ Community-friendly reusable package

---

## 🧠 How It Works

1. **Python Server (Flask + MediaPipe):**
   - Captures video using OpenCV
   - Uses MediaPipe to detect hand landmarks
   - Calculates distance between thumb tip and index tip
   - Converts that distance into a volume percentage (0–100%)
   - Exposes volume data via REST API

2. **Flutter App:**
   - Periodically requests volume data from the Flask server
   - Displays the live volume % in UI
   - Optionally controls Android volume using `volume_controller` package

---

## 🧪 Requirements

- Python 3.8+
- Flutter 3.16+ (with Android device/emulator)
- Same Wi-Fi network for PC & mobile device

---

## ⚙️ Setup

### 🔸 1. Run the Python Hand Gesture Server

Save this as `hand_control_server.py`:

```bash
pip install flask opencv-python mediapipe numpy
