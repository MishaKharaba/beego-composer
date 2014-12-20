package routers

import (
	"github.com/astaxie/beego"
	"github.com/jcrubino/beego-base/controllers"
)

func init() {
	beego.Router("/", &controllers.MainController{})

}
