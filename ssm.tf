locals {
    ssm_parameters = {
        vpc_id = {
            name = "/pragra/project-a/vpc/id"
            value = aws_vpc.custom_vpc.id
        }

         publicRT_id = {
            name = "/pragra/project-a/publicRT/id"
            value = aws_route_table.public_rt.id
        }

         subnet1_id = {
            name = "/pragra/project-a/subnet1/id"
            value = aws_subnet1.subnet1.id
        }
        subnet2_id = {
            name = "/pragra/project-a/subnet2/id"
            value = aws_subnet1.subnet2.id
        }
        subnet3_id = {
            name = "/pragra/project-a/subnet3/id"
            value = aws_subnet1.subnet3.id
        }
        subnet4_id = {
            name = "/pragra/project-a/subnet4/id"
            value = aws_subnet1.subnet4.id
        }
    }
}

resource "aws_ssm_parameter" "resources" {
  for_each = local.ssm_parameters

  name  = each.value.name
  type  = "String"
  value = each.value.value
}

