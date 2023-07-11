{{- define "stolon.ensure-observer-user.name" -}}
{{ printf "ensure-observer-user" }}
{{- end -}}

{{- define "stolon.ensure-observer-user.fullname" -}}
{{ printf "%s-%s" (include "stolon.fullname" .) (include "stolon.ensure-observer-user.name" .) }}
{{- end -}}

{{- define "stolon.ensure-observer-user.labels" -}}
{{ include "stolon.labels" . }}
app.kubernetes.io/name: {{ include "stolon.ensure-observer-user.name" . }}
{{- end -}}

{{- define "stolon.ensure-observer-user.selectorLabels" -}}
app.kubernetes.io/part-of: {{ include "stolon.name" . }}
app.kubernetes.io/name: {{ include "stolon.ensure-observer-user.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
