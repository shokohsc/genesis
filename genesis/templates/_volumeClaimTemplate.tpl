{{/* General Volume Claim Template */}}
{{- define "volumeClaimTemplate" }}
{{- range $volumeClaimTemplate := . }}
{{- with $volumeClaimTemplate }}
- metadata:
    name: {{ required "volumeClaim name is required" .name | quote }}
    {{- with .annotations }}
    annotations:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  spec:
    {{- include "persistentVolumeClaimSpec" . | nindent 4 }}

{{- end }}
{{- end }}

{{- end }}
