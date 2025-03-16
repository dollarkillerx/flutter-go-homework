package response

import "github.com/gin-gonic/gin"

type Common struct {
	Code    int         `json:"code"`
	Message string      `json:"message,omitempty"`
	Data    interface{} `json:"data,omitempty"`
}

func Response(ctx *gin.Context, code int, message string, data interface{}) {
	ctx.JSON(200, Common{Code: code, Message: message, Data: data})
}
