{{- define "stolon.exporter.name" -}}
{{ printf "exporter" }}
{{- end -}}

{{- define "stolon.exporter.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.exporter.name" .) }}
{{- end -}}

{{- define "stolon.exporter.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.exporter.name" . }}
{{- end -}}

{{- define "stolon.exporter.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Set DATA_SOURCE_URI environment variable
*/}}
{{- define "prometheus-postgres-exporter.data_source_uri" -}}
{{ printf "%s:%s/%s?sslmode=%s" .Values.exporter.datasource.host .Values.exporter.datasource.port .Values.exporter.datasource.database .Values.exporter.datasource.sslmode | quote }}
{{- end }}