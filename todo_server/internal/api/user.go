package api

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"github.com/golang-jwt/jwt/v5"
	"todo_server/internal/conf"
	"todo_server/internal/storage"
	"todo_server/pkg"
	"todo_server/pkg/request"
	"todo_server/pkg/response"

	"time"
)

type UserController struct {
	storage *storage.Storage
	conf    conf.Config
}

func NewUserController(storage *storage.Storage, conf conf.Config) *UserController {
	return &UserController{storage: storage, conf: conf}
}

func (u *UserController) register(ctx *gin.Context) {
	var userRegister request.UserRegister
	if err := ctx.ShouldBindJSON(&userRegister); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	// Initialize the validator
	validate := validator.New()

	// Validate the userLogin struct
	if err := validate.Struct(userRegister); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	err := u.storage.RegisterUser(userRegister.Email, pkg.Md5(userRegister.Password))
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}
	response.Response(ctx, 200, "success", nil)
}

func (u *UserController) login(ctx *gin.Context) {
	var userLogin request.UserLogin
	if err := ctx.ShouldBindJSON(&userLogin); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	// Initialize the validator
	validate := validator.New()

	// Validate the userLogin struct
	if err := validate.Struct(userLogin); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	user, err := u.storage.LoginUser(userLogin.Email, pkg.Md5(userLogin.Password))
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	// gen jwt token
	claims := jwt.MapClaims{
		"sub": user.Email,                            // 用户 ID
		"iat": time.Now().Unix(),                     // 签发时间
		"exp": time.Now().Add(time.Hour * 24).Unix(), // 过期时间 24 小时后
	}

	// 创建一个新的 Token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	// 使用密钥签名生成 JWT
	signedToken, err := token.SignedString([]byte(u.conf.JWTSecretKey))
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	response.Response(ctx, 200, "success", gin.H{
		"token": signedToken,
	})
}
