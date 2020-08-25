node()
{

try
{
		stage("checkout-properties")
		{
		  checkout scm;
		}
		stage("Set Up Environment")
		{
		  try
		  {
			  tfHome = tool 'terraform';
			  env.TERRAFORM_HOME="${tfHome}";
		  }catch(Exception e)
		  {
			
		  }
		}

		stage ("Intialize")
		{
		  def exitcode = terraform(terraformDir, "init");
		  if(0 == exitcode) {
		  
		  }else {
		  
		  }
		}

		def terraform(terraformDir, action)
		{
		  def EXIT_CODE;
		  println env.aws_region;
		  withCredentials([[
			 $class: 'AmazonWebServicesCredentialsBinding',
			 credentialsId: 'AWS_ACCESS_KEY_ID',
			 secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
		  
		  ]])
		  {
			scripts {
			   if(action == "init"){
			   
				  options = "-reconfigure \
				  -backend-config='region=${env.aws_region)'";
			   }else if( action == "destroy")
			   {
				  options= "-force";
			   } else if( action == "apply")
			   {
				  options= "-auto-apprpve";
			   }else {
				 options= "";
			   }
			   
			   EXIT_CODE = sh(returnStatus: true, script:"""" terraform ${action} ${options} """");
			}
		  
		  }

		}

		}
	}catch(Exception e){
	
	  throw e;
	
	}

}

