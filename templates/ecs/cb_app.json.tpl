[
  {
    "name": "${container_name}",
    "image": "${app_image}",
    "cpu": ${cpu_size},
    "memory": ${memory_size},
    "networkMode": "${network_mode}",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/cb-app",
          "awslogs-region": "${aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]