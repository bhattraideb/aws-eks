resource "aws_db_subnet_group" "main" {
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
  name = "${local.prefix}-main"

  tags = merge(
    local.common_tags,
    tomap({ "Name" = "${local.prefix}-main" })
  )
}

resource "aws_security_group" "rds" {
  description = "Allow access to the RDS database instance"
  name        = "${local.prefix}-rds-inbound-access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 5432
    protocol  = "tcp"
    to_port   = 5432

    security_groups = [
      aws_security_group.bastion.id,
      aws_security_group.ecs_service.id,
    ]
  }

  tags = local.common_tags

}

resource "aws_db_instance" "main" {
  identifier              = "${local.prefix}-db"
  engine                  = "postgres"
  engine_version          = "12.10"
  instance_class          = "db.t2.micro"
  allocated_storage       = 20
  db_name                    = "django_app"
  username                = var.db_username
  password                = var.db_password
  storage_type            = "gp2"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  backup_retention_period = 0
  multi_az                = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds.id]

  tags = merge(
    local.common_tags,
    tomap({ "Name" = "${local.prefix}-main" })
  )
}
