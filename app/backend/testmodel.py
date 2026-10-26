from ultralytics import YOLO

model = YOLO("yolov8n.pt")

results = model("https://ultralytics.com/images/bus.jpg", conf=0.5)

for box in results[0].boxes:
    label = model.names[int(box.cls)]
    confidence = float(box.conf)
    print(label, round(confidence, 2))
