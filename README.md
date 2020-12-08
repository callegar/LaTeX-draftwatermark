# The `draftwatermark` LaTeX package

The `draftwatermark` package extends LaTeX providing a means to add a textual
gray or colored watermark on every page or on the first page of a
document. Typical usage may consist in writing words such as "DRAFT" or
"CONFIDENTIAL" across document pages. The package may remind in some sense
`draftcopy` by Dr. Juergen Vollmer, but its implementation is lighter (as the
reduced code footprint shows) and does not rely on postscript specials, making
the package fully compatible with pdfLaTeX, XeLaTeX and LuaLaTeX.

The package focus is on simplicity, for complex layouts please consider
`scrlayer.sty` in the KOMA script bundle or directly employing the new
LaTeX hooks `shiphout/background` and `shipout/foreground`.

The `draftwatermark` package is copyright 2006, 2012, 2020 by Sergio Callegari
<sergio.callegari@gmail.com>.

This work consists of this `README.md` file, as well as files:
- `draftwatermark.dtx`, 
- `draftwatermark.ins`
and the derived files.

To install the package, run TeX/LaTeX on the installation script
`draftwatermark.ins` and follow the instructions provided by the script itself.


## License

Package `draftwatermark` may be distributed and/or modified under the
conditions of the LaTeX Project Public License, version 1.3. This license is
available at <https://www.latex-project.org/lppl/lppl-1-3c/>.


## Maintenace status

This work has the LPPL maintenance status "maintained".


## Development and bug tracking

Development happens on github at
<https://github.com/callegar/LaTeX-draftwatermark>.  Please refer to that site
for bug tracking.
