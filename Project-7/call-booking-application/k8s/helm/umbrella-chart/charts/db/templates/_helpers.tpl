{{- define "db.labels" -}}
app: mongo-db
module: database
env: {{ .Values.db.env }}
{{- end -}}

{{- define "db.namespace" -}}
database
{{- end -}}

{{- define "db.svc.name" -}}
mongo-db-svc
{{- end -}}

{{- define "db.secret.name" -}}
mongo-db-secrets-{{ .Release.Name }}
{{- end -}}
