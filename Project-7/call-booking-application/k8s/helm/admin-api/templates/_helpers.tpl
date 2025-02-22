{{- define "api-labels" -}}
app: admin-api
module: admin
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "api-namespace" -}}
admin
{{- end -}}

{{- define "api-secret-name" -}}
admin-api-secrets-{{ .Release.Name }}
{{- end -}}