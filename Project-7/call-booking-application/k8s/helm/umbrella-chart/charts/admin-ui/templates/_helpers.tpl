{{- define "admin.ui.labels" -}}
app: admin-ui
module: admin
env: {{ .Values.apps.env }}
{{- end -}}

{{- define "admin.ui.namespace" -}}
admin
{{- end -}}

{{- define "admin.ui.cm.name" -}}
admin-ui-cm-{{ .Release.Name }}
{{- end -}}