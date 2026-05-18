# Preferencias del usuario - Brayan

## Idioma
- Comunicarse SIEMPRE en español.
- Los commits deben ser en español, cortos y precisos.
- Las tareas (TaskCreate) deben ser en español.

## Git - Flujo de trabajo
- Antes de subir cambios, verificar si estamos en trunk/main.
- Si estamos en trunk/main, CREAR una rama nueva antes de hacer cambios.
- NUNCA subir cambios directos a trunk/main.
- Flujo: verificar rama → crear rama si es trunk → hacer cambios → commit → push.

## Calidad de código
- Las soluciones deben estar alineadas con las mejores prácticas de la industria.
- Siempre implementar buenas prácticas actualizadas.
- Mantener el código limpio, mantenible y siguiendo estándares modernos.

## Principios de desarrollo limpio (aplicar siempre)
- **KISS**: La solución más simple que funcione. Sin over-engineering.
- **DRY**: Nunca duplicar lógica. Abstraer cuando haya 3+ repeticiones.
- **YAGNI**: No construir lo que no se necesita hoy.
- **SOLID**: Una responsabilidad por clase, abierto a extensión, cerrado a modificación, sustitución de Liskov, interfaces segregadas, dependencias invertidas.
- **High Cohesion / Low Coupling**: Módulos enfocados y poco dependientes entre sí.
- **Separation of Concerns**: Cada capa/módulo con una sola preocupación.
- **Clean Architecture**: Dependencias apuntan hacia adentro. Dominio independiente del framework.

## Principios de desarrollo seguro (aplicar siempre)
- **Least Privilege**: Todo proceso/usuario con el mínimo acceso necesario.
- **Shift Left Security**: La seguridad se integra desde el primer commit, no al final.
- **Secure by Default**: La configuración por defecto debe ser la más segura.
- **Input Validation**: Nunca confiar en datos externos. Validar y sanitizar siempre.
- **Secrets Management**: Cero secretos en código o logs. Usar variables de entorno o vaults.
- **Fail Securely**: En caso de error, el sistema falla de forma segura, no expone datos.
- **Defense in Depth**: Múltiples capas de seguridad. Nunca depender de una sola.
- **Zero Trust**: Nunca asumir confianza implícita. Siempre verificar.

## Principios Cloud Native / DevSecOps
- **GitOps**: La infraestructura y configuración vive en Git como fuente de verdad.
- **IaC**: Toda infraestructura como código, versionada y revisable.
- **Immutable Infrastructure**: No parchear en producción. Reemplazar, no modificar.
- **Twelve-Factor App**: Configuración en entorno, logs como streams, procesos stateless.
- **Policy as Code / Compliance as Code**: Las reglas de seguridad y cumplimiento son código ejecutable.
- **Observability**: Todo sistema debe ser medible: logs, métricas y trazas.
