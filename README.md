# Creating Worksheets

This project generates 4 `.phd`s and 1 `.hs` from each correctly formatted `.lhs`.
  The `.pdf`s consist of question and answers in both hyperlegible and dyslexic formats.
  The `.hs` file contains any code featured in the `.lhs` file so that students can immediately play with any code we give them.

[lhs2tex](https://www.andres-loeh.de/lhs2tex/) is used so that any haskell code is type checked as part of the generation process.

To get create a worksheet:
  - copy `sheetTemplate.lhs`
  - rename your copy so that it has the format "sheet*.lhs" where star can be any non-empty sequence of alphanumeric characters.
  - fill in your questions with solutions, mimicing the examples in `sheetTemplate.lhs`
  - run `make`

# File Tour

`default.nix` - sets up `nix-shell` with required dependencies
`/nix` - this folder is required for `default.nix`
`*.tff` - the fonts for the worksheets. Annoyingly these cannot be tidied into folders. (or at least I could not figure out how)
  Atkinson = our default font. It is hyperlegible.
  Sylexiad = our dyslexic font.
  Inconsolata = our font for code.
`.gitignore` - tells git what files to not add to repo. We ignore generated files (`.pdf` and `.hs`) so that they do not become out of sync with the `.lhs` files they are generated from
`format.fmt` - for `lhs2tex`
`MakeFile` - will create four pdfs and 1 hs file for each sheet.
`README.md` - this file that is hopefully helping you use this set-up! Keep this up to date so it remains helpful :-D
`sheetTemplate` - a template for your sheets, showing you how the `.lhs` files should be formatted to create worksheets.
`worksheet.cks` - manages the \solution macros etc
`worksheet.sty` - allows us to have our custom hyperlegible and dyslexic-friendly formats.

# Dependencies

You can get all the necessary Haskell and latex dependencies easily by using the nix.
If you have nix set up, just enter a nix-shell and you are good to go, the `default.nix` file specifies everything you need.
If you do not have nix, the `default.nix` file can still be of assistance to you as it lists all dependencies.