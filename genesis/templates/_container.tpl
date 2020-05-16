{{/* General Container Template */}}
{{- define "container" }}
{{- range $container := . }}
{{- with $container }}
- name: {{ required "container name is required" .name | quote }}
  image: "{{ required "container image is required" .image.repository }}:{{ required "container image tag is required" .image.tag }}"
  imagePullPolicy: {{ .imagePullPolicy | default "Always" | quote }}
  workingDir: {{ .workingDir | default "/" | quote }}

  {{- with .command }}
  command:
  {{- range $value := . }}
    - {{ $value | quote }}
  {{- end }}
  {{- end }}

  {{- with .args }}
  args:
  {{- range $value := . }}
    - {{ $value | quote }}
  {{- end }}
  {{- end }}
  
  {{- with .securityContext }}
  securityContext:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .ports }}
  ports:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .env }}
  env:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .envFrom }}
  envFrom:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .volumeMounts }}
  volumeMounts:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .livenessProbe }}
  livenessProbe:
    {{- toYaml . | nindent 4 }}
  {{- end }}

  {{- with .readinessProbe }}
  readinessProbe:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  resources:
    requests:
      cpu: {{ required "CPU requests are required" .resources.requests.cpu | quote }}
      memory: {{ required "Memory requests are required" .resources.requests.memory | quote }}
    limits:
      cpu: {{ required "CPU requests are required" .resources.limits.cpu | quote }}
      memory: {{ required "Memory requests are required" .resources.limits.memory | quote }}
{{- end }}
{{- end }}

{{- end }}
