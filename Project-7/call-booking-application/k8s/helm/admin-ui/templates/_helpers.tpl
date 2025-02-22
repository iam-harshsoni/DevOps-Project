{{- define "ui-labels" -}}
app: admin-ui
module: admin
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "ui-namespace" -}}
admin
{{- end -}}

{{- define "ui-cm-name" -}}
admin-ui-cm-{{ .Release.Name }}
{{- end -}}