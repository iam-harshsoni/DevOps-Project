{{- define "ui.labels" -}}
app: user-ui
module: user
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "ui.namespace" -}}
user
{{- end -}}

{{- define "ui.cm.name" -}}
user-ui-cm-{{ .Release.Name }}
{{- end -}}