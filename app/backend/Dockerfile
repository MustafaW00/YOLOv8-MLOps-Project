FROM python:3.13-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install torch==2.14.1 torchvision==0.29.1 --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt
RUN pip uninstall -y opencv-python && pip install --force-reinstall opencv-python-headless==5.0.0.93

FROM python:3.13-slim
COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
WORKDIR /app
RUN useradd -m appuser
USER appuser
COPY . /app
CMD ["python3", "app.py"]
