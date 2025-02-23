{{- define "user.api.labels" -}}
app: {{ .Values.apps.name }}
module: user
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "user.api.namespace" -}}
user
{{- end -}}

{{- define "user.api.selector.label" -}}
app: {{ .Values.apps.name }}
module: user
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "user.api.secret.name" -}}
user-api-secrets-{{ .Release.Name }}
{{- end -}}

{{- define "user.api.cm.name" -}}
user-api-cm-{{ .Release.Name }}
{{- end -}}