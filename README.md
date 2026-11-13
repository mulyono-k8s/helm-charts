# helm-charts
### Install helm charts pada windows
winget install Helm.Helm
helm version

###  Setelah Restart Terminal Masih command not found
Winget biasanya menyimpan alias helm.exe di dalam folder WinGet\Links. Jika terminal UCRT64 Anda belum membacanya secara otomatis, daftarkan secara manual ke .bashrc dengan perintah ini:
echo 'export PATH="$PATH:/c/Users/user/AppData/Local/Microsoft/WinGet/Links"' >> ~/.bashrc
source ~/.bashrc
helm version
helm list -A

### Create Sonarqube
helm install sonarqube-app ./sonarqube -f ./sonarqube/values.yaml -n security --create-namespace
helm upgrade sonarqube-app ./sonarqube -f ./sonarqube/values.yaml -n security --create-namespace
helm uninstall sonarqube-app -n security

### Create owasp
helm install owasp-zap-app ./owasp-zap -f ./owasp-zap/values.yaml -n security --create-namespace
helm upgrade owasp-zap-app ./owasp-zap -f ./owasp-zap/values.yaml -n security --create-namespace
helm uninstall owasp-zap-app -n security

### Create Trivy
helm install trivy-app ./trivy -f ./trivy/values.yaml -n security --create-namespace
helm upgrade trivy-app ./trivy -f ./trivy/values.yaml -n security --create-namespace
helm uninstall trivy-app -n security

### Install jenkins with helm chart
helm install jenkins-app ./jenkins -f ./jenkins/values.yaml -n security --create-namespace
helm upgrade jenkins-app ./jenkins -f ./jenkins/values.yaml -n security --create-namespace
helm uninstall jenkins-app -n security 

### Create my-app
helm upgrade my-app-release-services ./my-app -f ./my-app/values.yaml -n app --create-namespace

### Jarvis-web
helm install jarvis-app-release-services ./jarvis-web -f ./jarvis-web/values.yaml -n app --create-namespace --set image.tag="latest"

helm upgrade jarvis-app-release-services ./jarvis-web -f ./jarvis-web/values.yaml -n app --create-namespace --set image.tag="latest"
helm uninstall jarvis-app-release-services -n app 

### Install Kafka with helm chart
1. add repo
helm repo add strimzi https://strimzi.io --force-update
helm repo update
2. Install strimzi-operator sebagai otak
helm install strimzi-operator strimzi/strimzi-kafka-operator \
  --namespace kafka \
  --create-namespace \
  --set watchAnyNamespace=true
3. Install kafka  
helm install kafka-dev-app ./kafka -f ./kafka/values.yaml -n kafka
4. Upgrade strimzi-operator
helm upgrade strimzi-operator strimzi/strimzi-kafka-operator \
  --namespace kafka \
  --create-namespace \
  --set watchAnyNamespace=true  
helm upgrade kafka-dev-app ./kafka -f ./kafka/values.yaml -n kafka  
  4. Delete
helm uninstall strimzi-operator  -n kafka

## Set hosts
C:\Windows\System32\drivers\etc

