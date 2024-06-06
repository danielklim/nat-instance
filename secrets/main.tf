resource "aws_secretsmanager_secret" "main" {
    name                        = "${var.name}_${var.environment}"
    description                 = "${var.description}"
    tags                        = merge(var.tags, try(each.value.tags, {}))
}

resource "aws_secretsmanager_secret_version" "main" {
    secret_id                   = aws_secretsmanager_secret.main.id
    secret_string               = base64encode(var.secret_string)
}