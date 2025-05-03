package middleware

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"todo_server/pkg/response"
)

func Auth(secretKey string) gin.HandlerFunc {
	return func(c *gin.Context) {

		headerToken := c.GetHeader("Authorization")

		// 解析并验证JWT
		token, err := jwt.Parse(headerToken, func(token *jwt.Token) (interface{}, error) {
			// 确保签名方法是我们期望的
			if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
			}
			return []byte(secretKey), nil
		})

		if err != nil {
			response.Response(c, 401, err.Error(), nil)
			c.Abort()
			return
		}

		// 检查token是否有效
		if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
			c.Set("claims", claims)
			c.Set("user_id", claims["user_id"]) // 将用户ID添加到上下文
			//c.Set("role", )
		} else {
			response.Response(c, 401, "invalid token", nil)
			c.Abort()
			return
		}

		c.Next()
	}
}
