# markdown-to-pdf
Docker image using pandoc and typst to generate a pdf file from a markdown file.
I want to generate pdf changelogs out of markdown files including emoji support.
Specifically, I use [git-cliff](https://github.com/orhun/git-cliff) to create a markdown changelog out of conventional commits.
Using this container the changelog can be converted to pdf.

## Usage
Sets `Noto Sans` font internally. Also renders emojis like 🚀 and so on.

Nushell example:
``` nu
docker run --rm --volume $"($env.PWD):/data" --rm <CONTAINER NAME> input.md -o output.pdf --pdf-engine=typst --template=changelog
```