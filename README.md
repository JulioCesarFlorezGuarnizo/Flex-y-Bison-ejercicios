# Flex y Bison – Ejercicios Capítulo 1

Implementación completa de los ejercicios 1–6 del Capítulo 1 del libro  
**Flex & Bison – John Levine**.

Desarrollado en macOS utilizando:

- flex (Homebrew)
- bison (Homebrew)
- gcc / clang

---

## 📁 Estructura del Proyecto

Flex y Bison ejercicios/
│
├── ej1.l # Ejercicio 1 – Contador extendido
├── ej2.l # Ejercicio 2 – Nueva definición de palabra
├── ej3.l # Ejercicio 3 – Traductor British → American
├── ej4.l # Scanner calculadora (Ej. 4, 5 y 6)
├── ej4.y # Parser calculadora extendida

---

# 🔹 Ejercicio 1 – Contador Extendido

Cuenta:

- Líneas
- Palabras (solo letras)
- Números
- Caracteres

### Compilación

flex ej1.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl

### Ejecución

./a.out

---

# 🔹 Ejercicio 2 – Redefinición de Palabra

Palabra definida como cualquier secuencia que no sea whitespace:

[^\t\n ]+

### Compilación

flex ej2.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl

---

# 🔹 Ejercicio 3 – Traductor British → American

Traduce palabras respetando mayúsculas.

Ejemplos:

Colour → Color
COLOUR → COLOR
colour → color

### Compilación

flex ej3.l
gcc lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl

---

# 🔹 Ejercicio 4 – Calculadora con Paréntesis

Soporta:

- +
- -
- *
- /
- Paréntesis
- Precedencia correcta

### Compilación

bison -d ej4.y
flex ej4.l
gcc ej4.tab.c lex.yy.c -L/opt/homebrew/opt/flex/lib -lfl

### Ejemplo

(3+4)*2
= 14

---

# 🔹 Ejercicio 5 – Operador Potencia

Agrega:

^

Con asociatividad derecha:

%right '^'

Ejemplo:

2^3^2
= 512

---

# 🔹 Ejercicio 6 – Menos Unario

Implementado con precedencia correcta:

%right UMINUS
| '-' expr %prec UMINUS

Ejemplos:

-5 → -5
-2^3 → -8
(-2)^3 → -8

---

# ⚙ Requisitos

Instalar dependencias:

brew install flex
brew install bison

Agregar al PATH (Apple Silicon):

export PATH="/opt/homebrew/opt/bison/bin:/opt/homebrew/opt/flex/bin:$PATH"

---

# ✅ Estado

✔ Ejercicio 1  
✔ Ejercicio 2  
✔ Ejercicio 3  
✔ Ejercicio 4  
✔ Ejercicio 5  
✔ Ejercicio 6  

Capítulo 1 completado correctamente.
