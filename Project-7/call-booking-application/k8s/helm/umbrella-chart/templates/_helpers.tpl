{{- define "env.config" -}}
{{- if eq .Values.global.env "dev" -}}
values-dev.yaml
{{- else if eq .Values.global.env "qa" -}}
values-qa.yaml
{{- else if eq .Values.global.env "prod" -}}
values-prod.yaml
{{- else -}}
values-dev.yaml
{{- end -}}
{{- end }}
