{{/* General Pod Template */}}
{{- define "pod" -}}
terminationGracePeriodSeconds: {{ default 30 .terminationGracePeriodSeconds }}
dnsPolicy: {{ .dnsPolicy | default "ClusterFirst" | quote }}
hostIPC: {{ default false .hostIPC }}
hostNetwork: {{ default false .hostNetwork }}
hostPID: {{ default false .hostPID }}
restartPolicy: {{ .restartPolicy | default "Always" | quote }}
shareProcessNamespace: {{ default false .shareProcessNamespace }}

{{- if .activeDeadlineSeconds }}
activeDeadlineSeconds: {{ .activeDeadlineSeconds | quote }}
{{- end }}

{{- if .subdomain }}
subdomain: {{ .subdomain | quote }}
{{- end }}

{{- if .schedulerName }}
schedulerName: {{ .schedulerName | quote }}
{{- end }}

{{- if .hostname }}
hostname: {{ .hostname | quote }}
{{- end }}

{{- if .nodeName }}
nodeName: {{ .nodeName | quote }}
{{- end }}

{{- if .serviceAccountName }}
serviceAccountName: {{ .serviceAccountName | quote }}
{{- end }}

{{- if .automountServiceAccountToken }}
automountServiceAccountToken: {{ .automountServiceAccountToken | quote }}
{{- end }}

{{- if .priority }}
priority: {{ .priority | quote }}
{{- end }}

{{- if .priorityClassName }}
priorityClassName: {{ .priorityClassName | quote }}
{{- end }}

{{- with .nodeSelector }}
nodeSelector:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .tolerations }}
tolerations:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .affinity }}
affinity:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .dnsConfig }}
dnsConfig:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .imagePullSecrets }}
imagePullSecrets:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .hostAliases }}
hostAliases:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .volumes }}
volumes:
  {{- toYaml . | nindent 2 }}
{{- end }}

{{- with .initContainers }}
initContainers:
{{- include "container" . | nindent 2 }}
{{- end }}

containers:
{{- include "container" .containers | nindent 2 }}

{{- end }}