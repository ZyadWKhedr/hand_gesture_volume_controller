🖐️ Hand Gesture Volume Controller
Control your Android phone’s volume using just your hand gestures — no buttons or touch needed!
This Flutter package works alongside a small Python server that uses your webcam to detect hand movements and adjusts the phone volume in real time over Wi-Fi.

📽️ Demo
🎬 Watch Demo on YouTube
(Replace with your screen recording link)

🔧 Requirements
A Windows PC or laptop with a webcam

An Android phone connected to the same Wi-Fi network

Python 3.8+

Flutter 3.x

🚀 How It Works
Python runs a lightweight Flask server that accesses your webcam.

It uses MediaPipe to detect the distance between your thumb and index finger.

That distance is mapped to a volume percentage (0–100).

The Python server sends this volume over Wi-Fi to the Flutter app.

The Flutter app updates your Android phone’s volume in real-time.

📦 How to Use
✅ Step 1: Clone the Project
bash
Copy
Edit
git clone https://github.com/ZyadWKhedr/hand_gesture_volume_controller.git
cd hand_gesture_volume_controller
🐍 Step 2: Run the Python Server
Navigate to the server/ folder:

bash
Copy
Edit
cd server
Install the Python dependencies:

bash
Copy
Edit
pip install flask opencv-python mediapipe numpy
Start the server:

bash
Copy
Edit
python hand_control_server.py
🚨 Don’t close this terminal!
It runs the webcam and sends live volume data over Wi-Fi.

You should see something like:

nginx
Copy
Edit
Running on http://192.168.xx.xx:5000
👉 Copy that IP address — you’ll paste it into the Flutter app.

📱 Step 3: Run the Flutter App
Open the example/ folder in VS Code or any Flutter IDE.

In main.dart, update the server IP like this:

dart
Copy
Edit
final controller = GestureVolumeController(
  serverUrl: 'http://192.168.xx.xx:5000/volume-data',
);
Run the app on your Android phone:

bash
Copy
Edit
flutter run
🟢 You should now see the volume bar update as you move your fingers in front of your webcam!

✋ Supported Gestures
Volume Control: Distance between thumb and index finger

Mute: Fingers touch (distance ≈ 0)

Live Display: Volume level updates instantly in the app

🗂️ Project Structure
css
Copy
Edit
hand_gesture_volume_controller/
│
├── lib/                    → Flutter package code
│   └── hand_gesture_volume_controller.dart
│
├── example/                → Demo Flutter app
│   └── main.dart
│
├── server/                 → Python server for hand tracking
│   └── hand_control_server.py
│
├── pubspec.yaml
└── README.md
🧠 What I Learned (and You Will Too!)
Real-time hand tracking with MediaPipe

Sending data between Python (Flask) and Flutter over Wi-Fi

Creating your first custom Flutter package

Intro to Computer Vision and gesture-based control

🤝 Contribute or Fork
Want to improve this?

Add more gestures (pause, next/prev, swipe)

Improve UI and animations

Try porting to iOS or add platform support

📜 License
MIT © 2025 Zyad Khedr
Made with ❤️ using Flutter, Python, and MediaPipe