FROM ubuntu:20.04

# Install Open3D system dependencies and pip
RUN apt-get update && apt-get install --no-install-recommends -y \
    libegl1 \
    libgl1 \
    libgomp1 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Open3D from the PyPI repositories
RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade open3d

WORKDIR /app
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .

ENV PYTHONUNBUFFERED=1

CMD ["python3", "main.py"]