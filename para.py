import os
import subprocess

# Define a function to deploy Elastic Beanstalk environment for a specific workspace
def deploy_environment(workspace):
    try:
        # Change directory to the workspace
        print(f"Before chdir: {os.getcwd()}")
        # Get the absolute path of the script directory
        script_dir = os.path.dirname(os.path.abspath(__file__))
        
        # Change directory to the workspace
        os.chdir(os.path.join(script_dir, workspace))
        print(f"After chdir: {os.getcwd()}")
        # Run Terraform commands for deployment
        subprocess.run(["terraform", "init", "-input=false"], check=True, shell=True)
        subprocess.run(["terraform", "apply", "-auto-approve", "-lock=false"], check=True, shell=True)
    except Exception as e:
        print(f"Error deploying workspace {workspace}: {e}")

# List of Terraform workspace directories
workspaces = [r"workspace/workspace1", r"workspace/workspace2", r"workspace/workspace3"]  # Add your workspace directories here

# Iterate through workspaces sequentially
for workspace in workspaces:
    deploy_environment(workspace)

print("Sequential deployment completed.")

