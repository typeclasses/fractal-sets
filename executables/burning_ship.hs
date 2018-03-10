module Main where
import Plot
import Graphics.GD
import Data.Complex

imageDim :: Size
imageDim = (600,600)

-- How many iterations before  we declare the point doesn't diverge
maxIter = 255

-- Coordinates in the complex plane to graph
-- First coordinate must be top left
mbWindow :: Window
mbWindow = ( (-1.8, 0.02), (-1.7, -0.08) ) -- smaller ship on horizon

main :: IO ()
main = drawPlot drawShip imageDim mbWindow "burning_ship.png"

drawShip :: Coordinate -> Color
drawShip (x,y) = colorIterations $ ship (x :+ y) (0 :+ 0) 0

-- Count number of iterations for the given point to diverge
-- Non-diverging points return 0
ship :: Complex Double -- Coordinate to test
           -> Complex Double -- Iterating Z value
           -> Int -- Current iteration
           -> Int -- Iterations before diverging
ship c z iter
    | iter > maxIter = 0
    | otherwise = let z' = (abs(realPart z) :+ abs(imagPart z))^2 + c in
                  if magnitude z' > 2
                  then iter
                  else ship c z' (iter+1)

colorIterations :: Int -> Color
colorIterations x
    | x > maxIter = rgb 255 255 255
    | otherwise = rgb x x x
