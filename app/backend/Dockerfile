FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt .
RUN apt update && apt install -y libxcb1 libgl1 libglib2.0-0t64 libsm6 libxext6 libxrender1
RUN pip install -r requirements.txt
COPY . /app
CMD ["python3" , "app.py"]
