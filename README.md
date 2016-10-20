# Research Computing Docs

This is documentation for the RITS Research Computing services,
to be rendered into a website using Jekyll and templating using
a mechanism found elsewhere (not yet implemented but probably
to be in another repo, which should be linked here when someone
remembers).

It is automatically linted using [MDL](https://github.com/mivok/markdownlint)
after each commit using [Travis](http://travis-ci.org/).

Linting Status: [![Build Status](https://travis-ci.org/UCL-RITS/rc-docs-content.svg?branch=master)](https://travis-ci.org/UCL-RITS/rc-docs-content)

Please note that this is still an on-going conversion from a
MediaWiki dump, and not all pages have been converted yet.
If you see a page that is not converted, want to convert it,
and have vim and pandoc, you may want to try opening
it in `vim`, and using:

```vimscript
:%!pandoc -f mediawiki -t markdown_github
:g/^==*$/dl|exe "normal k" |s/^/## /
:g/^--*$/dl|exe "normal k" |s/^/### /
```

This should use pandoc to convert it, and convert the Setext-style
headings into ATX-style ones. (Which I think are better for editing, but
that's just my opinion, obviously.)

Editors using vim may also want to set up Syntastic with MDL to
get the same linting client-side as on the Travis checks; instructions
for how to do that will be pasted here when the style options have been
hashed out.

## Possible things to do

- make a metrics layout for posts

- should known issues be posts?

- make a style guide (then tweak MDL options to fit)
