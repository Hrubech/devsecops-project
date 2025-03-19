# 🚀 DevSecOps CI/CD Pipeline Project

Ce projet met en place une architecture **DevSecOps** complète sur **AWS EKS** en utilisant **Terraform** pour l'infrastructure, **Jenkins** pour l'automatisation CI/CD, **ArgoCD** pour le déploiement GitOps, ainsi que **Trivy** et **SonarQube** pour renforcer la sécurité et la qualité du code.

![Architecture Diagram](docs/architecture-diagram.png)

---
## 🚀 Technologies utilisées
- **AWS EKS** : Orchestration de conteneurs avec Kubernetes
- **Terraform** : Infrastructure as Code (IaC)
- **Jenkins** : CI/CD pipeline pour l'automatisation des builds et déploiements
- **ArgoCD** : Déploiement GitOps pour Kubernetes
- **Trivy** : Analyse des vulnérabilités des conteneurs
- **SonarQube** : Analyse statique du code pour la qualité et la sécurité
- **Docker** : Conteneurisation des applications

---
## ⚙️ Architecture
L'architecture suit un workflow DevSecOps sécurisé :
1. **Provisioning de l'infrastructure** avec Terraform sur AWS
2. **Configuration du cluster Kubernetes** avec AWS EKS
3. **CI/CD avec Jenkins** :
   - Build et test de l'application
   - Analyse de sécurité avec Trivy et SonarQube
   - Construction et push des images Docker
4. **Déploiement GitOps avec ArgoCD**
5. **Monitoring de la sécurité et de la conformité**

---
## 📌 Prérequis
- Un compte **AWS**
- **Kubectl** installé
- **Terraform** installé
- **Jenkins** configuré avec les plugins nécessaires
- **ArgoCD** installé sur le cluster
- **Docker** et un registre d'images (Docker Hub, ECR...)

---
## 🏗️ Déploiement
### 1️⃣ Infrastructure AWS avec Terraform
```sh
cd terraform
terraform init
terraform apply -auto-approve
```
### 2️⃣ Configuration de Kubernetes et ArgoCD
```sh
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.4.7/manifests/install.yaml
kubectl get pods -n argocd
```
### 3️⃣ Mise en place du pipeline CI/CD
Configurer Jenkins avec les étapes suivantes :
- Build et test
- Scan de sécurité avec Trivy
- Analyse de code avec SonarQube
- Déploiement avec ArgoCD

### 4️⃣ Déploiement avec ArgoCD
```sh
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Se connecter à **http://localhost:8080** et ajouter le dépôt Git pour déclencher le déploiement.

---
## 🔍 Sécurité et Qualité
- **Trivy** : Scanner les images Docker pour détecter les vulnérabilités
```sh
trivy image my-app:latest
```
- **SonarQube** : Vérification de la qualité et des failles de sécurité du code

---
## 📜 Conclusion
Ce projet fournit une **chaîne DevSecOps complète** avec des contrôles de sécurité intégrés dès les premières étapes du développement et jusqu’au déploiement en production sur **AWS EKS**.

---
## 📌 Améliorations futures
- Intégration de **Prometheus & Grafana** pour la surveillance
- Ajout de **GitLab CI/CD** comme alternative à Jenkins
- Automatisation avancée avec **Terraform modules**

---
## 🏆 Auteur
[Hrubech](https://github.com/Hrubech)