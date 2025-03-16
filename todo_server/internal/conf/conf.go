package conf

import "todo_server/pkg/common/config"

type Config struct {
	ServiceConfiguration  config.ServiceConfiguration
	PostgresConfiguration config.PostgresConfiguration
	LoggerConfiguration   config.LoggerConfig

	JWTSecretKey string
}
