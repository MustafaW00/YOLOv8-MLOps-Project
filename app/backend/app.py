from flask import Flask, jsonify, request
from ultralytics import YOLO
from PIL import Image

app = Flask(__name__)
model = YOLO("yolov8n.pt")
from flask_cors import CORS     # with the other imports at the top
CORS(app)                       # right under app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify(status="ok")

@app.route("/predict", methods=["POST"])
def predict():
    file = request.files["image"]
    image = Image.open(file)
    results = model(image, conf=0.5)

    detections = []
    for box in results[0].boxes:
        label = model.names[int(box.cls)]
        confidence = float(box.conf)
    detections.append({"label": label, "confidence": round(confidence, 2),"box":box.xyxy[0].tolist()})
    return jsonify(detections=detections)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
