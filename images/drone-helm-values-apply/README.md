# drone-helm-values-apply

Renders Go templates in-place. Useful for having Drone inject secrets and
commit information into files.

All of the [sprig functions](http://masterminds.github.io/sprig/strings.html)
are available for convenient templating.

## To Build:
go get github.com/Masterminds/sprig
go get github.com/codegangsta/cli
go build
Docker build .