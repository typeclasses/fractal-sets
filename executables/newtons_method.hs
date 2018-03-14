module Main where
import Plot
import Graphics.GD
import Data.Complex

imageDim :: Size
imageDim = (600,600)

-- How many iterations before  we declare the point doesn't diverge
maxIter = 96

-- How close successive tests must be before we declare they have converged
minDiff = 0.0001

-- formula to iterate
f z = 3 * z^4 - 1
-- derivative
f' z = 12 * ( z^3)

-- Coordinates in the complex plane to graph
-- First coordinate must be top left.
mbWindow :: Window
mbWindow = ( (-2.0, 2.0), (2.0, -2.0) ) -- Full view

main :: IO ()
main = drawPlot drawNewton imageDim mbWindow "newtons-method.png"

drawNewton :: Coordinate -> Color
drawNewton (x,y) = colorIterations $ newton (x :+ y) 0

-- Count number of iterations for the given point to diverge
-- Non-diverging points return 0
newton :: Complex Double -- Coordinate to test
       -> Int -- Current iteration
       -> Int -- Iterations before diverging
newton z iter
    | iter > maxIter = 0
    | ( abs $ magnitude r - magnitude z) > minDiff = newton r (iter + 1)
    | otherwise = iter
    where r = z - f z / f' z

colorIterations :: Int -> Color
colorIterations x
    | x > maxIter = rgb 255 255 255
    | otherwise = rgb (x^2) x (x*3)
