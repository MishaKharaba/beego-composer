package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/astaxie/beego/session/mysql" // used for all session stores
	_ "github.com/astaxie/beego/session/redis"
	_ "github.com/jcrubino/beego-composer/models"
	_ "github.com/jcrubino/beego-composer/routers"
	_ "github.com/lib/pq"
	"log"
	"time"
)

func init() {
	// Development Settings, adjust for production
	// mysql / sqlite3 / postgres driver registered by default already
	maxIdle := 10 // (optional):  set maximum idle connections
	maxConn := 10 // (optional):  set maximum connections (go >= 1.2)

	orm.RegisterDriver("postgres", orm.DR_Postgres)

	//                    db alias  drivername
	orm.RegisterDataBase("default", "postgres", "user=beego password=password dbname=beego sslmode=disable", maxIdle, maxConn)
	orm.DefaultTimeLoc = time.UTC

}

func main() {
	beego.TemplateLeft = "<<<" // set to make internal template compatible with most front ends i.e. Angular, Polymer, etc
	beego.TemplateRight = ">>>"

	name := "default"
	// Whether to drop table and re-create.
	force := true
	// Print log.
	verbose := true
	// Error.
	err := orm.RunSyncdb(name, force, verbose)
	if err != nil {
		log.Println(err)
	}
	beego.Run()
}
