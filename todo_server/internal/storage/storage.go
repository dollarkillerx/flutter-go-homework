package storage

import (
	"gorm.io/gorm"
	"todo_server/pkg/models"
)

type Storage struct {
	db *gorm.DB
}

func NewStorage(db *gorm.DB) *Storage {
	db.AutoMigrate(models.Todo{}, models.User{})

	return &Storage{db: db}
}

func (s *Storage) DB() *gorm.DB {
	return s.db
}
