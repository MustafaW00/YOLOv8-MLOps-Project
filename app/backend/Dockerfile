FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt .
RUN apt update && apt install -y libxcb1 libgl1 libglib2.0-0t64 libsm6 libxext6 libxrender1
RUN pip install torch==2.14.1 torchvision==0.29.1 --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt
RUN useradd -m appuser
USER appuser
COPY . /app
CMD ["python3", "app.py"]
