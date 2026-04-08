{{/*
Expand the name of the chart.
*/}}
{{- define "tansu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "tansu.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
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
{{- define "tansu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tansu.labels" -}}
helm.sh/chart: {{ include "tansu.chart" . }}
{{ include "tansu.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tansu.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tansu.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "tansu.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tansu.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Build the PostgreSQL connection string
*/}}
{{- define "tansu.postgresUrl" -}}
{{- if .Values.storage.postgres.url }}
{{- .Values.storage.postgres.url }}
{{- else }}
{{- printf "postgres://%s:$(DB_PASSWORD)@%s:%d/%s" .Values.storage.postgres.username .Values.storage.postgres.host (int .Values.storage.postgres.port) .Values.storage.postgres.database }}
{{- end }}
{{- end }}

{{/*
Advertised listener URL
*/}}
{{- define "tansu.advertisedListenerUrl" -}}
{{- if .Values.kafka.advertisedListenerUrl }}
{{- .Values.kafka.advertisedListenerUrl }}
{{- else }}
{{- printf "tcp://%s.%s.svc.cluster.local:%d/" (include "tansu.fullname" .) .Release.Namespace (int .Values.kafka.port) }}
{{- end }}
{{- end }}
