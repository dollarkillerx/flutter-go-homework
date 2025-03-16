package api

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"todo_server/internal/storage"
	"todo_server/pkg/request"
	"todo_server/pkg/response"
)

type UserController struct {
	storage *storage.Storage
}

func NewUserController(storage *storage.Storage) *UserController {
	return &UserController{storage: storage}
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
}
