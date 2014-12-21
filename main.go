package main

import (
	"github.com/astaxie/beego"
	_ "github.com/jcrubino/beego-composer/routers"
)

func init() {
	orm.RegisterDataBase("default", "postgresql", "root:@(127.0.0.1:5442)/beego")

}

func main() {
	name := "default"
	// Whether to drop table and re-create.
	force := false
	// Print log.
	verbose := false
	// Error.
	err := orm.RunSyncdb(name, force, verbose)
	if err != nil {
		fmt.Println(err)
	}
	beego.Run()
}
