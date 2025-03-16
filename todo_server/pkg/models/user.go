package models

type User struct {
	BaseModel
	Email    string `gorm:"type:varchar(100);unique;not null" json:"email"`
	Password string `gorm:"type:varchar(255);not null" json:"password"`
}
