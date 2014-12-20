package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type AuthUser struct {
	Id                 int
	First              string
	Last               string
	Username           string `orm:"unique"`
	Email              string `orm:"unique"`
	Password           string
	Registration_token string
	Registration_data  time.Time `orm:"auto_now_add;type(datetime)"`
}
