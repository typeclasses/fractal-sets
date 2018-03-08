module Plot
    (
     Coordinate,
     Window,
     drawPlot
    ) where

import Graphics.GD

type Coordinate = (Double, Double)
type Window = (Coordinate, Coordinate)

drawPlot :: (Coordinate -> Color) -- ^ Plotting function
         -> Size   -- ^ Saved image dimensions
         -> Window -- ^ Coordinate space to test
         -> String -- ^ Filename of saved image
         -> IO ()
drawPlot d s w name =
    do pic <- newImage s
       fillImage (rgb 255 255 255) pic -- initialize with white canvas
       mapM_ (\p -> setPixel p (d (mapPixelToCoordinate p w s)) pic) $ allPixels s
       savePngFile name pic

-- | List of all pixels to test and plot
allPixels :: Size -> [Point]
allPixels (w,h) = [(x,y) | x <- [0..(w-1)], y <- [0..(h-1)]]

-- | Resolution-independent plotting.
-- From an image pixel and viewing window
-- definition, return a complex point.
mapPixelToCoordinate :: Point -> Window -> Size -> Coordinate
mapPixelToCoordinate (x,y) ((lx, ty),(rx, by)) (xsize, ysize) =
    let xscale = fromIntegral x / fromIntegral xsize
        yscale = fromIntegral y / fromIntegral ysize
    in
        ((((rx-lx) * xscale) + lx) , (((ty-by) * yscale) + by))
