```
[GIN-debug] GET    /health                   --> todo_server/internal/api.(*Server).HealthCheck-fm (4 handlers)
[GIN-debug] POST   /api/v1/public/register   --> todo_server/internal/api.(*UserController).register-fm (4 handlers)
[GIN-debug] POST   /api/v1/public/login      --> todo_server/internal/api.(*UserController).login-fm (4 handlers)
[GIN-debug] GET    /api/v1/private/tasks     --> todo_server/internal/api.(*TaskController).getTasks-fm (5 handlers)
[GIN-debug] POST   /api/v1/private/task      --> todo_server/internal/api.(*TaskController).createTask-fm (5 handlers)
[GIN-debug] PUT    /api/v1/private/task      --> todo_server/internal/api.(*TaskController).updateTask-fm (5 handlers)
```