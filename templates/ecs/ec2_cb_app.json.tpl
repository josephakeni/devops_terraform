[
  {
    "essential": true,
    "memory": 512,
    "name": "${container_name}",
    "cpu": 2,
    "image": "jakeni/jotonia-app:myapp1",
    "environment": [],
    "portMappings": [
      {
        "containerPort": ${app_port},
        "hostPort": ${app_port}
      }
    ]
  }
]