#base image 
FROM python:3.9-slim

# Set environment variables to prevent Python from writing .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# working directory
WORKDIR /app

#copy the requirement file 
COPY  requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates 
COPY static /app/static 

#install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#expose the port 
EXPOSE 5000

#command to run the application
CMD [ "python", "app.py" ]