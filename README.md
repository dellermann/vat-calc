# vat-calc

vat-calc is a client-side V.A.T calculator developed in JavaScript and CSS that
is compatible with [Bootstrap][] and [jQuery][].

## Usage

In order to use vat-calc add a HTML container element, e. g.

```html
<div class="calculator"></div>
```

Then load the CSS file (optionally use the minified version):

```html
<link rel="stylesheet" href="css/vat-calc.min.css" />
```

Alternatively, you can import the LESS files in your LESS code.

Add `<script></script>` tags to load jQuery and vat-calc (optionally use the
minified versions):

```html
<script src="jquery.min.js"></script>
<script src="js/vat-calc.min.js"></script>
```

Then call the following code in JavaScript:

```javascript
$(".calculator").vatcalc();
```

### Options

You can specify the following options when calling `vatcalc()`:

* `point` (String). Specifies the locale-dependent character for the
  decimal point (default is ".").

### Examples

```javascript
$(".calculator").vatcalc();      // use default options
$(".calculator").vatcalc({
    point: ","
});                             // use German notation
```

## Build <a name="Build"></a>

To build vat-calc perform the following steps:

1.  Prepare the `npm` environment using

    ```shell
    $ npm install
    ```

2.  Then execute

    ```shell
    $ grunt
    ```

3.  Afterwards, you find the built vat-calc files in ``target/build`` as well
    as a documentation in ``target/docs``.

## Demo

To build and view a demo perform the following steps:

1.  Install needed `npm` modules using

    ```shell
    $ npm install
    ```

2.  Build the demo page using

    ```shell
    $ grunt demo
    ```

3.  View `demo.html` in folder `target/demo` using your favorite browser.

## Customization

If you wish to customize the calculator, feel free to change the LESS variables
in ``less/variables.less`` and re-build the software as described under 
[Build](#Build).

## License

This piece of software was released under the [MIT License][MIT].

[Bootstrap]: http://getbootstrap.com
[jQuery]: http://jquery.com
[MIT]: http://opensource.org/licenses/MIT

