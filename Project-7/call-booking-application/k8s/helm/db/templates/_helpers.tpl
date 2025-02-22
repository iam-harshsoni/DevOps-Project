{{- define "db.labels" -}}
app: mongo-db
module: database
env: {{ .Values.db.env }}
{{- end -}}