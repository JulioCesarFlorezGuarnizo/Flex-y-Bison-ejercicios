# Flex y Bison – Ejercicios Capítulo 1

Implementación completa de los ejercicios 1 al 6 del Capítulo 1 del libro:

Flex & Bison – John Levine

Proyecto desarrollado en macOS usando flex y bison instalados con Homebrew.

---

## 📁 Estructura del Proyecto

```
Flex y Bison ejercicios/
│
├── ej1.l
├── ej2.l
├── ej3.l
├── ej4.l
├── ej4.y
└── README.md
```

Archivos generados automáticamente (NO se suben al repositorio):

```
a.out
lex.yy.c
ej4.tab.c
ej4.tab.h
```

---

# 🔧 Requisitos

Instalar dependencias:

```
brew install flex
brew install bison
```

Agregar al PATH (Apple Silicon):

```
export PATH="/opt/homebrew/opt/bison/bin:/opt/homebrew/opt/flex/bin:$PATH"
```

Verificar instalación:

```
which flex
which bison
flex --version
bison --version
```

---

# 📘 Ejercicio 1 – Contador Extendido

Cuenta:

- Líneas
- Palabras (solo letras)
- Números
- Caracteres

Compilar:

```
flex ej1.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl
```

Ejecutar:

```
./a.out
```

---

# 📘 Ejercicio 2 – Nueva Definición de Palabra

Palabra definida como cualquier secuencia que no sea whitespace:

```
[^\t\n ]+
```

Compilar:

```
flex ej2.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl
```

---

# 📘 Ejercicio 3 – Traductor British → American

Traduce palabras respetando mayúsculas y minúsculas.

Ejemplo:

```
Colour   → Color
COLOUR   → COLOR
colour   → color
```

Compilar:

```
flex ej3.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl
```

---

# 📘 Ejercicio 4 – Calculadora con Paréntesis

Soporta:

- +
- -
- *
- /
- Paréntesis
- Precedencia correcta

Compilar:

```
bison -d ej4.y
flex ej4.l
gcc ej4.tab.c lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl
```

Ejemplo:

```
(3+4)*2
= 14
```

---

# 📘 Ejercicio 5 – Operador Potencia

Agrega operador:

```
^
```

Declaración de precedencia:

```
%right '^'
```

Ejemplo:

```
2^3^2
= 512
```

Asociatividad derecha verificada.

---

# 📘 Ejercicio 6 – Menos Unario

Implementado con precedencia correcta usando:

```
%right UMINUS
| '-' expr %prec UMINUS
```

Ejemplos:

```
-5        → -5
-2^3      → -8
(-2)^3    → -8
```

La potencia tiene mayor precedencia que el menos unario.

---

# ▶ Compilación General (Calculadora)

```
rm ej4.tab.c ej4.tab.h lex.yy.c a.out
bison -d ej4.y
flex ej4.l
gcc ej4.tab.c lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl
./a.out
```

---

# ✅ Estado del Proyecto

✔ Ejercicio 1  
✔ Ejercicio 2  
✔ Ejercicio 3  
✔ Ejercicio 4  
✔ Ejercicio 5  
✔ Ejercicio 6  

Capítulo 1 completado correctamente.
