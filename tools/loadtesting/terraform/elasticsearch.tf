data "aws_default_tags" "current" {}

resource "aws_autoscaling_group" "elasticstack" {
  name                      = "${local.prefix}-elasticstack"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 3000
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = module.vpc.private_subnets
  target_group_arns         = [aws_lb_target_group.elasticsearch.arn, aws_lb_target_group.elasticapm.arn, aws_lb_target_group.kibana.arn]

  launch_template {
    id      = aws_launch_template.elasticstack.id
    version = "$Latest"
  }

  timeouts {
    delete = "15m"
  }

  dynamic "tag" {
    for_each = data.aws_default_tags.current.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  tag {
    key                 = "ansible_repository"
    value               = "https://github.com/fleetdm/fleet.git"
    propagate_at_launch = true
  }

  tag {
    key                 = "ansible_playbook_path"
    value               = "tools/loadtesting/terraform/elasticsearch_ansible"
    propagate_at_launch = true
  }

  tag {
    key                 = "ansible_playbook_file"
    value               = "elasticsearch.yml"
    propagate_at_launch = true
  }

  tag {
    key                 = "ansible_branch"
    value               = "zwinnerman-add-loadtest-infra-mine-fixup"
    propagate_at_launch = true
  }
}

data "aws_iam_policy_document" "elasticstack" {
  statement {
    effect    = "Allow"
    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["arn:aws:secretsmanager:us-east-2:917007347864:secret:/fleet/ssh/keys-7iQNe1"]
  }
}

data "aws_iam_policy_document" "assume_role_es" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "elasticstack" {
  name               = "fleetdm-es-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_es.json
}

resource "aws_iam_role_policy_attachment" "role_attachment_es" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.elasticstack.name
}

resource "aws_iam_policy" "elasticstack" {
  name   = "fleet-es-iam-policy"
  policy = data.aws_iam_policy_document.elasticstack.json
}

resource "aws_iam_role_policy_attachment" "elasticstack" {
  policy_arn = aws_iam_policy.elasticstack.arn
  role       = aws_iam_role.elasticstack.name
}

data "aws_ami" "amazonlinux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_template" "elasticstack" {
  name_prefix            = "${local.prefix}-elasticstack"
  image_id               = data.aws_ami.amazonlinux.image_id
  instance_type          = "t3.large"
  key_name               = "zwinnerman"
  vpc_security_group_ids = [aws_security_group.lb.id]
  metadata_options {
    instance_metadata_tags = "enabled"
    http_endpoint          = "enabled"
    http_tokens            = "required"
  }
  user_data = filebase64("${path.module}/elasticsearch.sh")
}

resource "aws_alb_listener" "elasticsearch" {
  load_balancer_arn = aws_alb.main.arn
  port              = 9200
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = aws_acm_certificate_validation.dogfood_fleetdm_com.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.elasticsearch.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "elasticsearch" {
  name     = "${local.prefix}-elasticsearch"
  port     = 9200
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_alb_listener" "elasticapm" {
  load_balancer_arn = aws_alb.main.arn
  port              = 8200
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = aws_acm_certificate_validation.dogfood_fleetdm_com.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.elasticapm.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "elasticapm" {
  name     = "${local.prefix}-elasticapm"
  port     = 8200
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_alb_listener" "kibana" {
  load_balancer_arn = aws_alb.main.arn
  port              = 5601
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  certificate_arn   = aws_acm_certificate_validation.dogfood_fleetdm_com.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.kibana.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "kibana" {
  name     = "${local.prefix}-kibana"
  port     = 5601
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}
