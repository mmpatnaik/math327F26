# Midterm materials — draft for instructor review

These files are saved on a draft branch for further editing. They have not been
merged into `main` or published to the course website.

- `midterm-1-coverage.tex` / `.pdf`: proposed 2026 coverage and review sheet.
- `midterm-1-2025.tex` / `.pdf`: the October 17, 2025 past examination.
- `midterm-1-2025-solutions.tex` / `.pdf`: solutions to that past examination.

All three use the existing course style in `../notes/math327-lecture.sty`.
The 2025 question numbering, points, mathematical content, and historical date
are preserved. The inverse notation `y^-1` in the uploaded solutions was
typeset as `y^{-1}`; the layout and solution boxes were updated.

## Edit and rebuild

From the repository root, with a working LaTeX installation:

```sh
cd exams
latexmk -pdf -interaction=nonstopmode -halt-on-error midterm-1-coverage.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error midterm-1-2025.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error midterm-1-2025-solutions.tex
cd ..
python3 build.py
```

Review the PDFs and `_site/index.html` locally. Recompile and commit the PDF
whenever its source changes: the existing publishing workflow compiles notes
and homework, but does not compile `exams/*.tex`.

Publishing requires a separate decision. Do not merge this draft into `main`
or manually dispatch the deployment workflow until it is approved.
