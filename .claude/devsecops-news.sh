#!/bin/bash
export PATH="/usr/bin:/bin:/usr/local/bin:$PATH"

RESULT=$(/usr/bin/curl -s --max-time 8 'https://devops.com/feed/' | /usr/bin/python3 -c "
import sys, re

c = sys.stdin.read()

# Extraer items del feed
items = re.findall(r'<item>(.*?)</item>', c, re.DOTALL)

for item in items[:5]:
    title_match = re.search(r'<title>(.*?)</title>', item, re.DOTALL)
    link_match = re.search(r'<link>(.*?)</link>', item, re.DOTALL)

    if title_match and link_match:
        title = re.sub(r'<!\[CDATA\[|\]\]>|<[^>]+>|&[^;]+;', '', title_match.group(1)).strip()
        link = link_match.group(1).strip()
        if len(title) > 20:
            print(title + '|||' + link)
            break
" 2>/dev/null)

if [ -z "$RESULT" ]; then
  echo '{"systemMessage": "DevSecOps News | No se pudo obtener la noticia. Revisa tu conexion."}'
  exit 0
fi

TITLE=$(echo "$RESULT" | cut -d'|' -f1)
LINK=$(echo "$RESULT" | sed 's/.*|||//')

# Traduccion basica de terminos comunes
TITULO=$(echo "$TITLE" \
  | sed 's/Why /Por que /g; s/How /Como /g; s/What /Que /g; s/When /Cuando /g' \
  | sed 's/Is Critical/Es Critico/g; s/for Modern/para la /g; s/Business Resilience/Resiliencia Empresarial/g' \
  | sed 's/Security/Seguridad/g; s/Deployment/Despliegue/g; s/Pipeline/Pipeline/g' \
  | sed 's/Container/Contenedor/g; s/Vulnerability/Vulnerabilidad/g; s/Attack/Ataque/g' \
  | sed 's/Threat/Amenaza/g; s/Cloud/Nube/g; s/Breach/Brecha/g; s/Fix/Corrección/g' \
  | sed 's/Update/Actualizacion/g; s/New /Nuevo /g; s/Best Practices/Mejores Practicas/g')

echo "{\"systemMessage\": \"DevSecOps | $TITULO\\n   Lee mas: $LINK\"}"
