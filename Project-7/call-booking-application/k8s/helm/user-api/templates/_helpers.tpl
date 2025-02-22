{{- define "api-labels" -}}
app: user-api
module: user
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "api-namespace" -}}
user
{{- end -}}

{{- define "api-selector-label" -}}
app: user-api
{{- end -}}

{{- define "api-secret-name" -}}
user-api-secrets-{{ .Release.Name }}
{{- end -}}

{{- define "api-cm-name" -}}
user-api-cm-{{ .Release.Name }}
{{- end -}}