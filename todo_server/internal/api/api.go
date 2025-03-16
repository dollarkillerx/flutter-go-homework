package api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"todo_server/internal/conf"
	"todo_server/internal/middleware"
	"todo_server/internal/storage"
)

type Server struct {
	storage *storage.Storage
	conf    conf.Config
	app     *gin.Engine
}

func NewApiServer(storage *storage.Storage, conf conf.Config) *Server {
	return &Server{storage: storage, conf: conf}
}

func (a *Server) Run() error {

	a.app = gin.New()
	a.app.Use(middleware.Cors())
	a.app.Use(middleware.HttpRecover())
	a.app.Use(gin.Logger())

	a.Router()

	return a.app.Run(fmt.Sprintf("0.0.0.0:%s", a.conf.ServiceConfiguration.Port))
}
