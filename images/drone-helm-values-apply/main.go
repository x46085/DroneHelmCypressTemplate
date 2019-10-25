package main

import (
	"fmt"
	"os"
	pathlib "path"
	"path/filepath"
	"strings"
	"text/template"

	"github.com/Masterminds/sprig"
	"github.com/codegangsta/cli"
)

func parseEnv(data []string) map[string]string {
	items := make(map[string]string)
	for _, item := range data {
		splits := strings.SplitN(item, "=", 2)
		key := splits[0]
		value := splits[1]
		items[key] = value
	}
	return items
}

func multiGlob(globs []string) ([]string, error) {
	paths := make(map[string]bool)
	for _, glob := range globs {
		matches, err := filepath.Glob(glob)
		if err != nil {
			return nil, err
		}
		for _, match := range matches {
			paths[match] = true
		}
	}

	var list []string
	for path, _ := range paths {
		list = append(list, path)
	}

	return list, nil
}

func renderTemplate(path string, data interface{}) error {
	name := pathlib.Base(path)
	tmpl := template.New(name).Funcs(sprig.TxtFuncMap())

	tmpl, err := tmpl.ParseFiles(path)
	if err != nil {
		return err
	}

	file, err := os.Create(path)
	if err != nil {
		return err
	}

	return tmpl.Execute(file, data)
}

func main() {
	app := cli.NewApp()
	app.Name = "drone-gotemplate"

	app.Flags = []cli.Flag{
		cli.StringFlag{
			Name:   "globs",
			EnvVar: "PLUGIN_GLOBS",
		},
	}

	app.Action = func(c *cli.Context) error {
		globs := strings.Split(c.String("globs"), ",")
		paths, err := multiGlob(globs)
		if err != nil {
			return err
		}

		env := parseEnv(os.Environ())

		for _, path := range paths {
			fmt.Printf("Rendering %s\n", path)
			if err := renderTemplate(path, env); err != nil {
				return err
			}
		}

		return nil
	}

	if err := app.Run(os.Args); err != nil {
		fmt.Fprintf(os.Stderr, "Error: %s\n", err)
		os.Exit(1)
	}
}
