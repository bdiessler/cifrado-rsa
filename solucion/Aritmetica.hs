module Aritmetica where
import Tipos
import Data.Tuple
import Data.Bits

-- Ejercicio 1

-- Da el primer número (mayor a 1) que de resto 0.
menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)

-- Decide si un numero es primo o no
esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = n == menorDivisorDesde n 2

-- Devuelve un conjunto de entero con todos los primos positivos menores a n.
criba :: Integer -> Set Integer
criba 1 = []
criba n | esPrimo (n-1) == True = (n-1) : criba (n-1)
        | otherwise = criba (n-1)

-- Ejercicio 2

-- Devuelve el Máximo Común Divisor.
mcd :: (Integer,Integer) -> Integer
mcd (a,0) = a
mcd (a,b) = mcd(b,mod a b)

-- Ingresa un número y busca un número que sea coprimo empezando en 2.
candidatoCoprimo :: Integer -> Integer -> Integer
candidatoCoprimo n x  | n == x = undefined
                      | mcd (n,x) == 1 = x
                      | otherwise = candidatoCoprimo n (x+1)

-- Devuelve el coprimo del número ingresado.
coprimoCon :: Integer -> Integer
coprimoCon n = candidatoCoprimo n (2)

-- Ejercicio 3

-- Ingresa dos números (a,b) devolviendo el MCD y la tupla (s,t) que cumpla la ecuación s*a + t*b = mcd (a,b)
mcdExt :: Integer -> Integer -> (Integer, (Integer, Integer))
mcdExt a 0 = (a , (1 , 0))
mcdExt a b = (mcd(a,b) ,(t1, s1 - (div a b)* t1))
                where ( _ , (s1 , t1)) = mcdExt b (mod a b)

-- Ingresa dos números (a y b) y devuelve, si existe, el inverso multiplicativo de a con módulo b.
inversoMultiplicativo:: Integer -> Integer -> Integer
inversoMultiplicativo n m | mcd (n,m) /= 1 = undefined
                          | otherwise = mod (fst (snd(mcdExt n m))) m

-- Función de regalo para exponenciar "rápido".
modExp :: Integer -> Integer -> Integer -> Integer
modExp b 0 m = 1
modExp b e m = t * modExp ((b * b) `mod` m) (shiftR e 1) m `mod` m
  where t = if testBit e 0 then b `mod` m else 1