{{- define "kafka-cluster.name" -}}
{{- default .Chart.Name .Values.kafka.name | trunc 63 | trimSuffix "-" -}}
{{- end }}
{{- define "kafka-cluster.labels" -}}
app.kubernetes.io/name: {{ include "kafka-cluster.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}
