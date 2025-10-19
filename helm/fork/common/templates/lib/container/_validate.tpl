{{/*
Validate container values
*/}}
{{- define "common.lib.container.validate" -}}
  {{- $rootContext := .rootContext -}}
  {{- $controllerObject := .controllerObject -}}
  {{- $containerObject := .containerObject -}}

  {{- if not (kindIs "map" $containerObject.image)  -}}
    {{- fail (printf "Image required to be a dictionary with repository and tag fields. (controller %s, container %s)" $controllerObject.identifier $containerObject.identifier) }}
  {{- end -}}

  {{- if empty (dig "image" "repository" nil $containerObject) -}}
    {{- fail (printf "No image repository specified for container. (controller %s, container %s)" $controllerObject.identifier $containerObject.identifier) }}
  {{- end -}}

  {{- if and (empty (dig "image" "tag" nil $containerObject)) (empty (dig "image" "digest" nil $containerObject)) -}}
    {{- fail (printf "No image tag or digest specified for container. (controller %s, container %s)" $controllerObject.identifier $containerObject.identifier) }}
  {{- end -}}
{{- end -}}
