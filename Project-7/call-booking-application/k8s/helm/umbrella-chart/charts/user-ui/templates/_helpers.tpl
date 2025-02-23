{{- define "user.ui.labels" -}}
app: user-ui
module: user
#env: {{ .Values.apps.env | default "dev" }}
env: dev
{{- end -}}

{{- define "user.ui.namespace" -}}
user
{{- end -}}

{{- define "user.ui.cm.name" -}}
user-ui-cm-{{ .Release.Name }}
{{- end -}}