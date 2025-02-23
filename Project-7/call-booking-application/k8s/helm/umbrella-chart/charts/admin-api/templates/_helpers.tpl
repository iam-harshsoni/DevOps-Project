{{- define "admin.api.labels" -}}
app: admin-api
module: admin
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "admin.api.namespace" -}}
admin
{{- end -}}

{{- define "admin.api.secret.name" -}}
admin-api-secrets-{{ .Release.Name }}
{{- end -}}