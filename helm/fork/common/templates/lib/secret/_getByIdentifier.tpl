{{/*
Return a secret Object by its Identifier.
*/}}
{{- define "common.lib.secret.getByIdentifier" -}}
  {{- $rootContext := .rootContext -}}
  {{- $identifier := .id -}}
  {{- $enabledSecrets := (include "common.lib.secret.enabledSecrets" (dict "rootContext" $rootContext) | fromYaml ) }}

  {{- if (hasKey $enabledSecrets $identifier) -}}
    {{- $objectValues := get $enabledSecrets $identifier -}}
    {{- include "common.lib.valuesToObject" (dict "rootContext" $rootContext "id" $identifier "values" $objectValues "itemCount" (len $enabledSecrets)) -}}
  {{- end -}}
{{- end -}}
