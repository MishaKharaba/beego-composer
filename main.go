package main

import (
	"github.com/astaxie/beego"
	//_ "github.com/go-sql-driver/mysql"
	"github.com/astaxie/beego/orm"
	_ "github.com/jcrubino/beego-composer/models"
	_ "github.com/jcrubino/beego-composer/routers"
	_ "github.com/lib/pq"
	"log"
	"time"
	//_ "github.com/mattn/go-sqlite3"
)

func init() {
	// Development Settings, adjust for production
	// mysql / sqlite3 / postgres driver registered by default already
	maxIdle := 10 // (optional):  set maximum idle connections
	maxConn := 10 // (optional):  set maximum connections (go >= 1.2)
	orm.RegisterDriver("postgres", orm.DR_Postgres)

	//                    db alias  drivername   db_user:password@(host:port)/db_name
	orm.RegisterDataBase("default", "postgres", "user=beego password=password dbname=beego sslmode=disable", maxIdle, maxConn)
	orm.DefaultTimeLoc = time.UTC

}

func main() {
	name := "default"
	// Whether to drop table and re-create.
	force := false
	// Print log.
	verbose := true
	// Error.
	err := orm.RunSyncdb(name, force, verbose)
	if err != nil {
		log.Println(err)
	}
	beego.Run()
}
