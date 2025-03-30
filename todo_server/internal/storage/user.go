package storage

import (
	"github.com/pkg/errors"
	"github.com/rs/zerolog/log"
	"todo_server/pkg/models"
)

func (s *Storage) RegisterUser(email string, password string) error {
	// 判断用户是否存在
	var user models.User
	err := s.db.Where("email = ?", email).First(&user).Error
	if err == nil {
		log.Info().Msgf("User already exists %s", email)
		return errors.New("User already exists")
	}

	// 不存在就创建
	err = s.db.Create(&models.User{Email: email, Password: password}).Error
	if err != nil {
		log.Info().Msgf("Failed to register user %s", err)
		return errors.WithStack(err)
	}
	return nil
}

func (s *Storage) LoginUser(email string, password string) (*models.User, error) {
	var user models.User
	err := s.db.Where("email = ? AND password = ?", email, password).First(&models.User{}).Error
	if err != nil {
		log.Info().Msgf("Failed to login user %s", err)
		return nil, errors.WithStack(err)
	}
	return &user, nil
}
