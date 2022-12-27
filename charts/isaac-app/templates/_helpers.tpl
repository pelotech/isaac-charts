{{/*
Expand the name of the chart.
*/}}
{{- define "isaac-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "isaac-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Fullname of API
*/}}
{{- define "isaac-app.api.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Fullname of ETL
*/}}
{{- define "isaac-app.etl.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.etl.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.etl.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Fullname of equality checker
*/}}
{{- define "isaac-app.eqChecker.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.eqChecker.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.eqChecker.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Fullname of chemistry checker
*/}}
{{- define "isaac-app.chemChecker.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.chemChecker.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.chemChecker.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Fullname of code editor
*/}}
{{- define "isaac-app.codeEditor.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.codeEditor.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.codeEditor.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Fullname of content editor
*/}}
{{- define "isaac-app.contentEditor.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.contentEditor.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.contentEditor.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "isaac-app.labels" -}}
helm.sh/chart: {{ include "isaac-app.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "isaac-app.api.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.api.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "isaac-app.etl.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.etl.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "isaac-app.eqChecker.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.eqChecker.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "isaac-app.chemChecker.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.chemChecker.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "isaac-app.codeEditor.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.codeEditor.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "isaac-app.contentEditor.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.contentEditor.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service Acct Names
*/}}
{{- define "isaac-app.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create }}
{{- default (include "isaac-app.api.fullname" .) .Values.api.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.api.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "isaac-app.etl.serviceAccountName" -}}
{{- if .Values.etl.serviceAccount.create }}
{{- default (include "isaac-app.etl.fullname" .) .Values.etl.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.etl.serviceAccount.name }}
{{- end }}
{{- end }}
