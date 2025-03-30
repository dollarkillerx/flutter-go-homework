package storage

import (
	"gorm.io/gorm"
	"todo_server/pkg/models"
)

type Storage struct {
	db *gorm.DB // pgsql
}

func NewStorage(db *gorm.DB) *Storage {

	// 自动迁移
	db.AutoMigrate(models.Todo{}, models.User{})

	return &Storage{db: db}
}

func (s *Storage) DB() *gorm.DB {
	return s.db
}
