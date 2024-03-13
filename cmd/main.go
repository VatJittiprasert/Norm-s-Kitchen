package main

import (
	"log"
	"normKitchen/internal/templates"

	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	r.GET("/", func(ctx *gin.Context) {
		home := templates.Home()
		err := templates.Layout(home, "Hello").Render(ctx.Request.Context(), ctx.Writer)
		if err != nil {
			log.Fatal(err)
		}
	})

	err := r.Run(":3000")
	if err != nil {
		log.Fatal(err)
	}
}
