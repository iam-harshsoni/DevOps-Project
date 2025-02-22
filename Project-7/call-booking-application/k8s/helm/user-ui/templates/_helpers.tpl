{{- define "ui.labels" -}}
app: user-ui
module: user
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "ui.namespace" -}}
namespace: user
{{- end -}}