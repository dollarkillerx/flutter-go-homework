package models

type Todo struct {
	BaseModel
	UserEmail   string `gorm:"type:varchar(100);not null" json:"user_email"`
	Title       string `gorm:"type:varchar(255);not null" json:"title"`
	Description string `gorm:"type:text" json:"description"`
}
