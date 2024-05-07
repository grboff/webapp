#!/bin/bash

# Создание виртуальной среды
python3 -m venv venv
source venv/bin/activate

# Установка зависимостей
pip install -r requirements.txt

# Сборка Docker образа
docker build -t mywebapp:latest -f docker/Dockerfile .

# Развертывание в Kubernetes
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/mywebapp-ingress.yaml

echo "Приложение развернуто и готово к использованию!"

