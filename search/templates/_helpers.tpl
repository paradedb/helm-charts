{{/*
Expand the name of the chart for Retake Search.
*/}}
{{- define "search.name" -}}
{{- default .Chart.Name .Values.search.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "search.fullname" -}}
{{- if .Values.search.fullnameOverride }}
{{- .Values.search.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.search.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "search.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "search.labels" -}}
helm.sh/chart: {{ include "search.chart" . }}
{{ include "search.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "search.selectorLabels" -}}
app.kubernetes.io/name: {{ include "search.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "search.serviceAccountName" -}}
{{- if .Values.search.serviceAccount.create }}
{{- default (include "search.fullname" .) .Values.search.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.search.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the configmap to use
*/}}
{{- define "search.configMapName" -}}
{{- default (include "search.fullname" .) .Values.search.configMap.name }}
{{- end }}



{{/*
Expand the name of the chart for Retake PGSync.
*/}}
{{- define "sync.name" -}}
{{- default "pgsync" .Values.pgsync.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sync.fullname" -}}
{{- if .Values.pgsync.fullnameOverride }}
{{- .Values.pgsync.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "pgsync" .Values.pgsync.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sync.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sync.labels" -}}
helm.sh/chart: {{ include "sync.chart" . }}
{{ include "sync.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sync.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sync.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sync.serviceAccountName" -}}
{{- if .Values.pgsync.serviceAccount.create }}
{{- default (include "sync.fullname" .) .Values.pgsync.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.pgsync.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the configmap to use
*/}}
{{- define "sync.configMapName" -}}
{{- default (include "sync.fullname" .) .Values.pgsync.configMap.name }}
{{- end }}
