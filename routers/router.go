package routers

import (
	"github.com/astaxie/beego"
	"github.com/jcrubino/beego-composer/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/register", &controllers.LoginController{}, "get:RegisterView;post:Register")

}
