# Cifrado RSA en Haskell

Este proyecto implementa el algoritmo de cifrado y descifrado RSA, un sistema criptográfico de clave pública ampliamente utilizado para proteger la confidencialidad de mensajes. El objetivo es mostrar, de manera didáctica, cómo funciona el proceso matemático detrás de RSA y cómo puede aplicarse para encriptar y desencriptar mensajes de texto.

## ¿Qué hace el proyecto?

- Permite generar claves públicas y privadas RSA a partir de dos números primos.
- Codifica (encripta) mensajes de texto usando la clave pública.
- Decodifica (desencripta) mensajes cifrados usando la clave privada.
- Incluye funciones auxiliares para trabajar con aritmética modular, primos, coprimalidad e inversos multiplicativos.
- Proporciona ejemplos y pruebas automáticas para ver el funcionamiento del cifrado RSA en la práctica.

## ¿Cómo funciona RSA? (Resumen)

1. Se eligen dos números primos grandes y se calculan los valores necesarios para las claves.
2. El mensaje se transforma en números (usando códigos ASCII).
3. Cada número se encripta con la clave pública mediante una operación de potencia y módulo.
4. El receptor puede desencriptar el mensaje usando la clave privada, recuperando el texto original.

## Estructura del código

- `Tipos.hs`: Define los tipos de datos principales y funciones de conversión entre caracteres y enteros.
- `Aritmetica.hs`: Implementa funciones matemáticas como la criba de primos, coprimalidad e inversos modulares.
- `RSA.hs`: Contiene la lógica de generación de claves, codificación y decodificación RSA.
- `main.hs`: Ejecuta pruebas automáticas de cifrado y descifrado de mensajes.

## Ejemplo de uso

```haskell
-- Generar claves con dos primos
let (e, d, n) = claves 7 11

-- Codificar un mensaje
let cifrado = codificador (e, n) "hola"

-- Decodificar el mensaje
let original = decodificador (d, n) cifrado
```

## Equipo de Desarrollo

- **Campestri Valentin**  
- **Diessler Bernardo**
- **Rodriguez Gabriel**

## Ejecución rápida

Compilar y correr el programa principal:

```bash
ghc -o main main.hs
./main
```

O cargar en GHCi:

```bash
ghci main.hs
main
```

## Notas

- El código es didáctico y no está pensado para uso en producción.
- Los ejemplos muestran cómo el cifrado RSA puede proteger mensajes simples.
- Se recomienda explorar y modificar los mensajes de prueba en `main.hs` para experimentar con el cifrado y descifrado.

---

*Implementación en honor a Rivest, Shamir y Adleman, inventores del protocolo RSA.*
