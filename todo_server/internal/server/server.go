package server

import (
	"todo_server/internal/api"
	"todo_server/internal/conf"
	"todo_server/internal/storage"
)

type Server struct {
	storage   *storage.Storage
	apiServer *api.Server
	conf      conf.Config
}

func NewServer(storage *storage.Storage, conf conf.Config) *Server {
	return &Server{storage: storage, apiServer: api.NewApiServer(storage, conf), conf: conf}
}

func (s *Server) Run() error {
	return s.apiServer.Run()
}
