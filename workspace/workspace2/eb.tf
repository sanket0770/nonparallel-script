terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"  # Change this to your desired AWS region
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name = "MyElasticBeanstalkAppsanket0001112"
}

resource "aws_elastic_beanstalk_environment" "my_environment" {
  name        = "MyEnvironmentsanket0001112"
  application = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.9 running Python 3.8"
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PYTHONPATH"
    value     = "/opt/python/current/app:/opt/python/run/venv/lib/python3.8/site-packages"
  }
   setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = "aws-elasticbeanstalk-ec2-role"
    }
}

# You can add additional resources like AWS RDS, S3, etc., based on your application requirements.
