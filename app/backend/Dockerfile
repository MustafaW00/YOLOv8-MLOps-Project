FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install torch==2.14.1 torchvision==0.29.1 --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt
RUN pip uninstall -y opencv-python && pip install --force-reinstall opencv-python-headless==5.0.0.93
RUN useradd -m appuser
USER appuser
COPY . /app
CMD ["python3", "app.py"]
