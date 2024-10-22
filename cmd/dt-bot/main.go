package main

import (
	"github.com/Chigatul/dt_bot/cmd"
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
)

func main() {
	if err := initConfig(); err != nil{
		logrus.Fatalf("error initialization configs: %s", err.Error())
	}
    
    cmd.Execute()
	
}

func initConfig() error {

	viper.AddConfigPath("configs")
	viper.SetConfigFile("config")
	return viper.ReadInConfig()
}
