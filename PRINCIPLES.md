# Engineering Principles — Brayan Umba

> Referencia rápida de principios de ingeniería de software, DevSecOps y arquitectura.

---

## 🧹 Desarrollo Limpio

| Principio | Descripción |
|---|---|
| **KISS** | Keep It Simple, Stupid. La solución más simple que funcione siempre gana. |
| **DRY** | Don't Repeat Yourself. Si lo escribiste 3 veces, abstráelo. |
| **YAGNI** | You Aren't Gonna Need It. No construyas lo que no necesitas hoy. |
| **Separation of Concerns** | Cada módulo/capa con una sola preocupación. |
| **Clean Code** | Código legible, nombres descriptivos, funciones pequeñas y enfocadas. |
| **Clean Architecture** | Dependencias apuntan hacia adentro. El dominio es independiente del framework. |
| **High Cohesion** | Los elementos de un módulo deben estar fuertemente relacionados. |
| **Low Coupling** | Los módulos deben depender lo menos posible entre sí. |
| **Boy Scout Rule** | Deja el código más limpio de como lo encontraste. |

---

## 🏛️ SOLID

| Letra | Principio | Descripción |
|---|---|---|
| **S** | Single Responsibility | Una clase = una sola razón para cambiar. |
| **O** | Open/Closed | Abierto para extender, cerrado para modificar. |
| **L** | Liskov Substitution | Las subclases deben poder reemplazar a su clase padre. |
| **I** | Interface Segregation | Mejor muchas interfaces pequeñas que una grande. |
| **D** | Dependency Inversion | Depende de abstracciones, no de implementaciones. |

---

## 🔐 Desarrollo Seguro

| Principio | Descripción |
|---|---|
| **Least Privilege** | Todo proceso/usuario con el mínimo acceso necesario. |
| **Defense in Depth** | Múltiples capas de seguridad. Nunca confiar en una sola. |
| **Zero Trust** | Nunca asumir confianza implícita. Siempre verificar. |
| **Fail Securely** | En caso de error, el sistema falla seguro, sin exponer datos. |
| **Secure by Default** | La configuración por defecto debe ser la más segura. |
| **Secure by Design** | La seguridad se diseña desde el inicio, no se agrega al final. |
| **Input Validation** | Nunca confiar en datos externos. Validar y sanitizar siempre. |
| **Output Encoding** | Codificar salidas para prevenir XSS e inyecciones. |
| **Secrets Management** | Cero secretos en código o logs. Usar vaults o variables de entorno. |
| **Encryption Everywhere** | Datos en tránsito y en reposo siempre cifrados. |
| **OWASP Top 10** | Conocer y mitigar las 10 vulnerabilidades más críticas. |

---

## 🔄 DevSecOps

| Principio | Descripción |
|---|---|
| **Shift Left Security** | Integrar seguridad desde el primer commit. |
| **SAST** | Static Application Security Testing — análisis estático del código. |
| **DAST** | Dynamic Application Security Testing — pruebas en runtime. |
| **SCA** | Software Composition Analysis — análisis de dependencias. |
| **SBOM** | Software Bill of Materials — inventario de componentes del software. |
| **Supply Chain Security** | Verificar la integridad de todas las dependencias y herramientas. |
| **Continuous Security** | La seguridad se ejecuta en cada pipeline, no solo en auditorías. |
| **Policy as Code** | Las políticas de seguridad son código ejecutable y versionado. |
| **Compliance as Code** | El cumplimiento regulatorio se automatiza como código. |

---

## ☸️ Cloud Native / Kubernetes

| Principio | Descripción |
|---|---|
| **Twelve-Factor App** | Estándar para apps cloud-native: config en entorno, logs como streams, etc. |
| **GitOps** | Git como única fuente de verdad para infraestructura y configuración. |
| **IaC** | Toda infraestructura como código, versionada y revisable. |
| **Immutable Infrastructure** | No parchear en producción. Reemplazar, no modificar. |
| **Declarative Configuration** | Describir el estado deseado, no los pasos para llegar. |
| **Observability** | Logs + Métricas + Trazas. Si no puedes medirlo, no puedes mejorarlo. |
| **Resilience Engineering** | Diseñar sistemas que fallen graciosamente y se recuperen solos. |
| **Autoscaling** | Los sistemas escalan automáticamente según la demanda. |
| **Self-Healing Systems** | El sistema detecta y corrige fallos sin intervención manual. |

---

## 🏗️ Arquitectura de Software

| Principio | Descripción |
|---|---|
| **DDD** | Domain-Driven Design — el dominio de negocio guía el diseño. |
| **Event-Driven Architecture** | Componentes se comunican mediante eventos asíncronos. |
| **CQRS** | Command Query Responsibility Segregation — separar lecturas de escrituras. |
| **Hexagonal Architecture** | El núcleo del negocio no depende de frameworks ni infraestructura. |
| **Microservices** | Servicios pequeños, independientes y desplegables por separado. |
| **API First** | Diseñar la API antes de implementar. |
| **Contract First** | El contrato entre servicios se define antes del código. |

---

## 🧪 Calidad y Testing

| Principio | Descripción |
|---|---|
| **TDD** | Test Driven Development — escribe el test antes que el código. |
| **BDD** | Behavior Driven Development — tests como especificaciones de comportamiento. |
| **Unit Testing** | Probar unidades aisladas de lógica. |
| **Integration Testing** | Probar la integración entre componentes reales. |
| **E2E Testing** | Probar el flujo completo del sistema. |
| **Chaos Engineering** | Inyectar fallos deliberados para encontrar debilidades. |
| **Performance Testing** | Medir y validar el rendimiento bajo carga. |

---

## 📡 Datos y APIs

| Principio | Descripción |
|---|---|
| **Idempotency** | La misma operación N veces produce el mismo resultado. |
| **Eventual Consistency** | El sistema llegará a consistencia, aunque no sea inmediata. |
| **Backpressure** | El consumidor controla la velocidad del productor. |
| **Retry Pattern** | Reintentar operaciones fallidas con backoff exponencial. |
| **Circuit Breaker** | Cortar el circuito ante fallos repetidos. Falla rápido, recupera rápido. |
| **Rate Limiting** | Limitar el número de solicitudes para proteger el sistema. |
| **API Gateway Pattern** | Punto único de entrada para APIs. |
| **Service Mesh** | Infraestructura dedicada para la comunicación entre servicios. |

---

## ⚙️ Principios Generales de Ingeniería

| Principio | Descripción |
|---|---|
| **GRASP** | General Responsibility Assignment Software Patterns. |
| **ACID** | Atomicity, Consistency, Isolation, Durability — transacciones de BD. |
| **CAP Theorem** | Un sistema distribuido solo puede garantizar 2 de 3: Consistencia, Disponibilidad, Tolerancia a particiones. |
| **Law of Demeter** | Un módulo solo habla con sus vecinos inmediatos, no con extraños. |
| **Conway's Law** | Tu arquitectura refleja la estructura de comunicación de tu equipo. |
| **Brooks's Law** | Agregar personas a un proyecto tardío lo retrasa más. |
| **Parkinson's Law** | El trabajo se expande para llenar el tiempo disponible. |
