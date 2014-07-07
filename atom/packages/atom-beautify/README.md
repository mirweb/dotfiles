# [atom-beautify](https://github.com/donaldpipowitch/atom-beautify)

> [Beautify](https://github.com/einars/js-beautify)
HTML (including [Handlebars](http://handlebarsjs.com/)),
CSS (including [Sass](http://sass-lang.com/) and [LESS](http://lesscss.org/))
and JavaScript in Atom.

Atom Package: https://atom.io/packages/atom-beautify

## Language Support

- [x] JavaScript and JSON
- [x] HTML, including
  - [Handlebars](http://handlebarsjs.com/)
  - XML
- [x] CSS, including
  - [Sass](http://sass-lang.com/)
  - [LESS](http://lesscss.org/)
- [x] SQL, special thanks to [pretty-data](https://github.com/vkiryukhin/pretty-data)
- [x] [PHP](https://github.com/donaldpipowitch/atom-beautify/issues/26)  
  - Requires [PHP_Beautifier](http://pear.php.net/package/PHP_Beautifier) to be already installed.
- [x] [Python](https://github.com/donaldpipowitch/atom-beautify/issues/24)
  - Requires [autopep8](https://github.com/hhatto/autopep8) to be already installed.
  - Beautifies to [PEP 8](http://legacy.python.org/dev/peps/pep-0008/).
- [x] [Ruby](https://github.com/donaldpipowitch/atom-beautify/issues/25)
  - Requires [RBeautify](https://github.com/erniebrodeur/ruby-beautify)

### Coming Soon

- [ ] CoffeeScript, see https://github.com/donaldpipowitch/atom-beautify/issues/31


## Usage

Open the [Command Palette](https://github.com/atom/command-palette), and type `Beautify`.

It will only beautify selected text, if a selection is found - if not, the whole file will be beautified.

### Shortcut

You can also type `ctrl-alt-b` as a shortcut or click `Packages > Beautify` in the menu.

### Package Options

You can also choose to beautify on every file save.


## Configuration

Edit your `.jsbeautifyrc` file in any of the following locations:

- Atom Package Settings  
  `Atom` ➔ `Preferences` ➔ Search for `atom-beautify`
- Same directory as current file
- Project root  
`atom-beautify` will recursively look up from the current file's directory to find `.jsbeautifyrc`.
- Your User's Home directory

**Note**: *Comments are supported in `.jsbeautifyrc` thanks to [strip-json-comments](https://github.com/sindresorhus/strip-json-comments).*

See examples of both way inside [`examples/`](https://github.com/donaldpipowitch/atom-beautify/tree/master/examples)

### Simple

See [examples/simple-jsbeautifyrc/.jsbeautifyrc](https://github.com/donaldpipowitch/atom-beautify/blob/master/examples/simple-jsbeautifyrc/.jsbeautifyrc).

```json
{
  "indent_size": 2,
  "indent_char": " ",
  "other": " ",
  "indent_level": 0,
  "indent_with_tabs": false,
  "preserve_newlines": true,
  "max_preserve_newlines": 2,
  "jslint_happy": true,
  "indent_handlebars": true
}
```

### Nested

See [examples/nested-jsbeautifyrc/.jsbeautifyrc](https://github.com/donaldpipowitch/atom-beautify/blob/master/examples/nested-jsbeautifyrc/.jsbeautifyrc).

```json
{
  "html": {
    "brace_style": "collapse",
    "indent_char": " ",
    "indent_scripts": "normal",
    "indent_size": 6,
    "max_preserve_newlines": 1,
    "preserve_newlines": true,
    "unformatted": ["a", "sub", "sup", "b", "i", "u"],
    "wrap_line_length": 0
  },
  "css": {
    "indent_char": " ",
    "indent_size": 4
  },
  "js": {
    "indent_size": 2,
    "indent_char": " ",
    "indent_level": 0,
    "indent_with_tabs": false,
    "preserve_newlines": true,
    "max_preserve_newlines": 2,
    "jslint_happy": true
  },
  "sql": {
    "indent_size": 4,
    "indent_char": " ",
    "indent_level": 0,
    "indent_with_tabs": false
  }
}
```

## Advanced Language Setup

### PHP

To use with PHP we require [PHP_Beautifier](http://pear.php.net/package/PHP_Beautifier)
and that you set the `Php beautifier path` in the package settings.

#### Retrieve the path on Mac & Linux

Run `which php_beautifier` in your Terminal.

### Python

To use with Python we require [autopep8](https://github.com/hhatto/autopep8)
and that you set the `Python autopep8 path` in the package settings.

#### Retrieve the path on Mac & Linux

Run `which autopep8` in your Terminal.


## Contributing

[See all contributors on GitHub](https://github.com/donaldpipowitch/atom-beautify/graphs/contributors).

Please update the [CHANGELOG.md](https://github.com/donaldpipowitch/atom-beautify/blob/master/CHANGELOG.md),
add yourself as a contributor to the [package.json](https://github.com/donaldpipowitch/atom-beautify/blob/master/package.json),
and submit a [Pull Request on GitHub](https://help.github.com/articles/using-pull-requests).

## License

[MIT](https://github.com/donaldpipowitch/atom-beautify/blob/master/LICENSE.md) © [Donald Pipowitch](https://github.com/donaldpipowitch)
