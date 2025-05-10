package storage

import (
	"github.com/pkg/errors"
	"github.com/rs/zerolog/log"
	"todo_server/pkg/models"
)

func (s *Storage) GetTodosByUserId(userId string) ([]models.Todo, error) {
	var todos []models.Todo
	err := s.db.Where("user_id = ?", userId).Find(&todos).Error
	if err != nil {
		log.Info().Msgf("Failed to get todos %s", err)
		return nil, errors.WithStack(err)
	}
	return todos, nil
}

func (s *Storage) CreateTodo(todo *models.Todo) error {
	err := s.db.Create(todo).Error
	if err != nil {
		log.Error().Msgf("Failed to create todo: %s", err)
		return errors.WithStack(err)
	}
	return nil
}

func (s *Storage) UpdateTodoByID(id string, todo *models.Todo) error {
	// 只更新字段，不重写整个对象（安全更新）
	err := s.db.Model(&models.Todo{}).Where("user_id = ?", id).Updates(map[string]interface{}{
		"title":       todo.Title,
		"description": todo.Description,
		"updated_at":  todo.UpdatedAt,
	}).Error
	if err != nil {
		log.Error().Msgf("Failed to update todo: %s", err)
		return errors.WithStack(err)
	}
	return nil
}
