{{/* General PersistentVolumeClaim Spec Template */}}
{{- define "persistentVolumeClaimSpec" -}}

{{- if .storageClassName }}
storageClassName: {{ .storageClassName | quote }}
{{- end }}

{{- if .volumeName }}
volumeName: {{ .volumeName | quote }}
{{- end }}

{{- if .volumeMode }}
volumeMode: {{ .volumeMode | quote }}
{{- end }}

resources:
  requests:
    storage: {{ required "Storage size is required" .resources.requests.storage }}

{{- with .accessModes }}
accessModes:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .dataSource }}
dataSource:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}