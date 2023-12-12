{{/*
Create common labels
*/}}
{{- define "paradedb.labels" -}}
app.kubernetes.io/name: {{ include "paradedb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
