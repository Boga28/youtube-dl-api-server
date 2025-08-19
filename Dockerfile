# Use the official Python image as the base image
FROM python:3.13

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the working directory
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Gunicorn ile 4 worker, 1 thread
CMD ["gunicorn", "-w", "4", "--threads", "1", "-b", "0.0.0.0:8080", "app:app", "--max-requests", "5", "--log-level", "debug"]
