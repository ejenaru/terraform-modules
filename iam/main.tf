resource "aws_iam_role" "roles" {
  for_each = { for role in var.roles : role.name => role }
  name               = each.key

  assume_role_policy = each.value.custom_trusted_policy != null ? each.value.custom_trusted_policy : templatefile("${path.module}/assume_role_policy.json", {
    service_name = "${each.value.service_name}"
  })

}

resource "aws_iam_role_policy" "role_policies" {
  for_each = { for role in var.roles : role.name => role } # Iterar directamente sobre la variable roles
  name     = "${each.key}_policy"
  role     = aws_iam_role.roles[each.key].name # Asociar la política al recurso creado
  policy   = each.value.policies
}



resource "aws_iam_user" "users" {
  for_each = { for user in var.users : user.name => user }
  name     = each.key
}

resource "aws_iam_user_policy" "user_policies" {
  for_each = { for user in var.users : user.name => user } # Iterar directamente sobre la variable roles
  name     = "${each.key}_policy"
  user     = aws_iam_user.users[each.key].name # Asociar la política al recurso creado
  policy   = each.value.policies
}

