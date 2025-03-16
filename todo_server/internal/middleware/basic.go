package middleware

import (
	"github.com/gin-gonic/gin"
	"github.com/rs/zerolog/log"

	"runtime"
	"runtime/debug"
)

// HttpRecover recover
func HttpRecover() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		defer func() {
			if err := recover(); err != nil {
				stackTrace := debug.Stack()
				runtime.Stack(stackTrace, true)
				log.Error().Msgf("HttpRecover url: %s stackTrace %s", ctx.Request.URL.Path, string(stackTrace))
			}
		}()
		ctx.Next()
	}
}
