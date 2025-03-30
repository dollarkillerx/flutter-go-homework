package models

type Todo struct {
	BaseModel
	UserID      string `gorm:"type:varchar(255);not null" json:"user_id"`
	Title       string `gorm:"type:varchar(255);not null" json:"title"`
	Description string `gorm:"type:text" json:"description"`
}
