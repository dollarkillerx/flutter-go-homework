package main

import (
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"log"
	"net/http"
	"strings"
	"sync"
	"time"
)

var jwtSecretKey = []byte("5d41402abc4b2a76b9719d911017c592")

func main() {
	app := gin.Default()
	storage := NewStorage()

	v1Group := app.Group("/api/v1")
	{
		v1Group.POST("/register", func(ctx *gin.Context) {
			var request RegisterRequest
			if err := ctx.BindJSON(&request); err != nil {
				log.Println("bind json error", err)
				ctx.JSONP(400, gin.H{"error": err.Error()})
				return
			}

			storage.RegisterUser(request.Email, request.Password)

			// gen jwt token
			claims := jwt.MapClaims{
				"sub": request.Email,                         // 用户 ID
				"iat": time.Now().Unix(),                     // 签发时间
				"exp": time.Now().Add(time.Hour * 24).Unix(), // 过期时间 24 小时后
			}

			// 创建一个新的 Token
			token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

			// 使用密钥签名生成 JWT
			signedToken, err := token.SignedString(jwtSecretKey)
			if err != nil {
				fmt.Println("Error signing token:", err)
				ctx.JSONP(500, gin.H{"error": err.Error()})
				return
			}

			ctx.JSONP(200, RegisterResponse{
				Jwt: signedToken,
			})
		})

		v1Group.POST("/login", func(ctx *gin.Context) {
			var request LoginRequest
			if err := ctx.BindJSON(&request); err != nil {
				log.Println("bind json error", err)
				ctx.JSONP(400, gin.H{"error": err.Error()})
				return
			}

			password := storage.GetUserPassword(request.Email)
			if password == "" {
				ctx.JSONP(400, gin.H{"error": "user not found or password incorrect"})
				return
			}

			if password != request.Password {
				ctx.JSONP(400, gin.H{"error": "user not found or password incorrect"})
				return
			}

			// gen jwt token
			claims := jwt.MapClaims{
				"sub": request.Email,                         // 用户 ID
				"iat": time.Now().Unix(),                     // 签发时间
				"exp": time.Now().Add(time.Hour * 24).Unix(), // 过期时间 24 小时后
			}

			// 创建一个新的 Token
			token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

			// 使用密钥签名生成 JWT
			signedToken, err := token.SignedString(jwtSecretKey)
			if err != nil {
				fmt.Println("Error signing token:", err)
				ctx.JSONP(500, gin.H{"error": err.Error()})
				return
			}

			ctx.JSONP(200, LoginResponse{
				Jwt: signedToken,
			})
		})

		//v1Group.Group("/public")
		private := v1Group.Group("/private", JWTAuthMiddleware())
		{
			private.POST("/todo/set", func(ctx *gin.Context) {
				email := ctx.MustGet("email").(string)
				var request TodoSetRequest
				if err := ctx.BindJSON(&request); err != nil {
					log.Println("bind json error", err)
					ctx.JSONP(400, gin.H{"error": err.Error()})
					return
				}

				marshal, err := json.Marshal(request.Tasks)
				if err != nil {
					ctx.JSONP(500, gin.H{"error": err.Error()})
					return
				}

				storage.SetTodo(email, string(marshal))

				ctx.JSONP(200, gin.H{})
			})

			private.GET("/todo/get", func(ctx *gin.Context) {
				email := ctx.MustGet("email").(string)
				todo := storage.GetTodo(email)

				var tasks = []TodoTask{}
				json.Unmarshal([]byte(todo), &tasks)
				ctx.JSONP(200, gin.H{
					"tasks": tasks,
				})
			})
		}

	}

	if err := app.Run("0.0.0.0:8181"); err != nil {
		panic(err)
	}
}

// request payload
type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type RegisterRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type TodoSetRequest struct {
	Tasks []TodoTask `json:"tasks"`
}

// repsonse payload
type LoginResponse struct {
	Jwt string `json:"jwt"`
}

type RegisterResponse struct {
	Jwt string `json:"jwt"`
}

// storage
type Storage struct {
	userStorage map[string]string // email: password
	todoStorage map[string]string // email: json data
	mu          sync.Mutex
}

func NewStorage() *Storage {
	return &Storage{
		userStorage: map[string]string{},
		todoStorage: map[string]string{},
		mu:          sync.Mutex{},
	}
}

func (s *Storage) RegisterUser(email string, password string) {
	s.mu.Lock()
	defer s.mu.Unlock()
	s.userStorage[email] = password
}

func (s *Storage) GetUserPassword(email string) string {
	s.mu.Lock()
	defer s.mu.Unlock()
	return s.userStorage[email]
}

func (s *Storage) SetTodo(email string, todo string) {
	s.mu.Lock()
	defer s.mu.Unlock()
	s.todoStorage[email] = todo
}

func (s *Storage) GetTodo(email string) string {
	s.mu.Lock()
	defer s.mu.Unlock()
	return s.todoStorage[email]
}

// JWTAuthMiddleware JWT 验证中间件
func JWTAuthMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		// 获取 Authorization 头部中的 Bearer token
		authHeader := c.GetHeader("Authorization")
		if authHeader == "" {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Authorization header required"})
			c.Abort()
			return
		}

		// Bearer token 格式： "Bearer <token>"
		tokenString := strings.TrimPrefix(authHeader, "Bearer ")

		// 解析 token
		token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
			return jwtSecretKey, nil
		})

		if err != nil || !token.Valid {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid or expired token"})
			c.Abort()
			return
		}

		// 如果验证通过，可以将 token 信息添加到上下文中
		claims, ok := token.Claims.(jwt.MapClaims)
		if !ok {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid token claims"})
			c.Abort()
			return
		}

		c.Set("email", claims["sub"])

		// 继续处理请求
		c.Next()
	}
}

type TodoTask struct {
	TaskName        string `json:"task_name"`
	TaskDescription string `json:"task_description"`
}
