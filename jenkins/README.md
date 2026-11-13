# Custom Jenkins Helm Chart

Chart ini digunakan untuk mendeploy Jenkins secara mandiri ke Kubernetes dengan dukungan penyimpanan persisten (Persistent Volume).

## Cara Penggunaan

1. Pastikan struktur file sudah sesuai di komputer Anda.
2. Lakukan validasi chart dengan perintah:
   ```bash
   helm lint ./jenkins-chart
   ```
3. Install chart ke Kubernetes cluster Anda:
   ```bash
   helm install jenkins-app ./jenkins-chart --namespace cicd --create-namespace
   ```
4. Akses Jenkins dashboard menggunakan IP Node Kubernetes Anda pada port `32080` (sesuai setelan NodePort di `values.yaml`).
