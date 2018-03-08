module Main where

import Plot
import Graphics.GD
import Data.Complex

imageDim :: Size
imageDim = (1200, 400)

-- How many iterations before  we declare the point doesn't diverge
maxIter = 64

-- Coordinates in the complex plane to graph
-- First coordinate must be top left.
mbWindow :: Window
mbWindow = ( (-3,1), (3,-1) ) -- Full view

-- C value
c :: Complex Double
c = (-0.423) :+ 0.745 -- Dust
-- c = (0.45) :+ (-0.1428)
-- c = (0.285 :+ 0.01)

main :: IO ()
main = drawPlot drawJulia imageDim mbWindow "juliaset.png"

drawJulia :: Coordinate -> Color
drawJulia (x,y) = colorIterations $ julia c (x :+ y) 0

-- Count number of iterations for the given point to diverge
-- Non-diverging points return 0
julia :: Complex Double -- Constant C
      -> Complex Double -- Iterating Z value
      -> Int -- Current iteration
      -> Int -- Iterations before diverging
julia c z iter
    | iter > maxIter = 0
    | otherwise = let z' = z^2 + c in
                  if magnitude z' > 2
                  then iter
                  else julia c z' (iter+1)

colorIterations :: Int -> Color
colorIterations x
    | x > maxIter = rgb 255 255 255
    | otherwise = let c = 50 + x
                      x'' = 50 + x*3 -- addition because when x was hitting zero as it iterates, we were ending up with black in the edges
                      x' = 100 + x*2
                  in rgb x'' c x'
