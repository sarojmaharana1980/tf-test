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
		  def exitcode = terraform("init");
		  if(0 == exitcode) {
		    println "Sucess";
		  }else {
		    println "Failure";
		  }
		}
		
		stage ("Apply")
		{
		  try
		  {
			  def exitcode = terraform("apply");
			  if(0 == exitcode) {
				println "Sucess";
			  }else {
				println "Failure";
			  }
		  }catch(Exception e)
		  {
			 println e; 
		  }
		}

		

		}catch(Exception e){
	
			throw e;
	
		}
}
		
		def terraform(action)
		{
		  def EXIT_CODE;
		  /*
		  println env.aws_region;
		  withCredentials([[
			 $class: 'AmazonWebServicesCredentialsBinding',
			 credentialsId: 'AWS_ACCESS_KEY_ID',
			 secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
		  
		  ]])*/
		  //{
			//scripts {
				
			  try {
				  
			   if(action == "init"){
			   
				  //options = "-reconfigure  -backend-config ='region = ${env.aws_region)'";
			   }else if( action == "destroy")
			   {
				  options= "-force";
			   } else if( action == "apply")
			   {
				   println "action=apply";
				  options= "-auto-apprpve";
			   }else {
				 options= "";
			   }
			   
			   }catch (Exception e)
			   {
				  println e; 
			   }
			   
			   EXIT_CODE = '0';
			   
			   //EXIT_CODE = sh(returnStatus: true, script:"""" terraform ${action} ${options} """");
			//}
		  
		  //}

		}
//}

//}

