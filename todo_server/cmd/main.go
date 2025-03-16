package main

import (
	"flag"
	"strings"

	"github.com/rs/zerolog/log"
	"todo_server/internal/conf"
	"todo_server/internal/server"
	"todo_server/internal/storage"
	"todo_server/pkg/common/client"
	"todo_server/pkg/common/config"
	"todo_server/pkg/logs"
)

var configFilename string
var configDirs string

func init() {
	const (
		defaultConfigFilename = "config"
		configUsage           = "Name of the config file, without extension"
		defaultConfigDirs     = "./,./configs/"
		configDirUsage        = "Directories to search for config file, separated by ','"
	)
	flag.StringVar(&configFilename, "c", defaultConfigFilename, configUsage)
	flag.StringVar(&configFilename, "dev_config", defaultConfigFilename, configUsage)
	flag.StringVar(&configDirs, "cPath", defaultConfigDirs, configDirUsage)
}

func main() {
	flag.Parse()
	var appConfig conf.Config
	err := config.InitConfiguration(configFilename, strings.Split(configDirs, ","), &appConfig)
	if err != nil {
		panic(err)
	}

	// 基础依赖初始化
	// 初始化日志
	logs.InitLog(appConfig.LoggerConfiguration)

	// 初始化数据库
	postgresClient, err := client.PostgresClient(appConfig.PostgresConfiguration, nil)
	if err != nil {
		log.Error().Msg("Failed to connect to postgres")
		panic(err)
	}

	st := storage.NewStorage(postgresClient)
	log.Info().Msg("Storage initialized")

	// 启动服务
	ser := server.NewServer(st, appConfig)
	if err := ser.Run(); err != nil {
		log.Error().Msgf("Failed to start server %s", err)
	}
}
