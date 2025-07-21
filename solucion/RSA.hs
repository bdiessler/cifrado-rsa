module RSA where
import Tipos
import Aritmetica


-- Ejercicio 4

-- Con dos números primos devuelve los componentes con los cuales se forman las claves públicas y privadas
claves :: Integer -> Integer -> (Integer, Integer, Integer)
claves p q = (e, d, n)
  where n = p*q
        m = (p-1)*(q-1)
        e = coprimoCon m
        d = inversoMultiplicativo e m

-- Ejercicio 5

-- Recibe un número y lo encripta según el sistema RSA.
encriptador :: Clpub -> Integer -> Integer
encriptador a b | mcd (b, snd a) == 1 = modExp (b) (fst a) (snd a)
                | otherwise = (-b)

-- Dada la clave pública y un mensaje lo codifica devolviendo el mensaje encriptado.
codificador :: Clpub -> Mensaje -> Cifrado
codificador a [] = []
codificador a (x:xs) = (encriptador a (head (aEnteros [x]))) : codificador a xs


-- Ejercicio 6

-- Recibe un número (caracter encriptado) y lo desencripta devolviendo el caracter original según el sistema RSA.
desencriptador :: Clpri -> Integer -> Integer
desencriptador (a,b) c  | c >= 0 = modExp c a b
                        | otherwise = (-c)

-- Dada la clave privada y el mensaje encriptado, devuelve el mensaje original.
decodificador :: Clpri -> Cifrado -> Mensaje
decodificador a [] = []
decodificador a (x:xs) = aChars [desencriptador a x] ++ decodificador a xs