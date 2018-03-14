# fractal-sets

Author: Greg Heartsfield

[Blog post with link to his darcs repository.](https://gregheartsfield.com/fractal-hs/)

## Using this package

Download the package, `cd` into the directory, and 

```shell
$ stack build
```

You can edit colors and other settings, such as image size, in any of the files in the `executables` directory. Each file is named for the type of fractal set it draws, and the file names match the executable names (see the `.cabal` file).

If you tweaked settings, you'll need to run `stack build` a second time to rebuild the executables with the current settings. To generate the image, use

```shell
$ stack exec -- <executable-name>
```

Running that will produce a file in the top level directory called <executable_name.png>. 

Happy fractal-ing!

## Examples

At [this commit](https://github.com/typeclasses/fractal-sets/commit/7fd97638564237f60afc43f0d41552db72101346), the code in the four executable files produce these images:

The Julia Set we used on the Learn Nix landing page:

![juliaset](https://github.com/typeclasses/fractal-sets/blob/master/images/juliaset.png)

A Mandelbrot Set: 

![mandelbrot](https://github.com/typeclasses/fractal-sets/blob/master/images/mandelbrot.png)

Newton's Method:

![Newton_method](https://github.com/typeclasses/fractal-sets/blob/master/images/newtonm.png)

And the Burning Ship:

![burning_ship](https://github.com/typeclasses/fractal-sets/blob/master/images/burning_ship.png)


