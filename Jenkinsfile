// git的凭证ID
def git_auth = "5f22344c-2779-4740-85d7-a7ed661df4ef"

// git的项目URL地址
def git_url = "git@gitlab.test.com:java_project/tensquare_back.git"
node {
    stage('拉取代码') {
 	    checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], extensions: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
	}

    stage('检测代码') {
            steps {
                script {
                    //引入SonarqubeScanner工具
                    scannerHome = tool 'sonarqube-scanner'
                }
                //引入SonarQube的服务器环境
                withSonarQubeEnv('sonarqube') {
                    sh """
                        //拉取完代码后，我们的Sonarqube默认是在父工程的根目录下，但我们需要构建是是微服务，就需要先切入到对应组件的根目录，而这里用到的变量即是我们在前面配置任务中定义的
                        cd ${project_name}
                        ${scannerHome}/bin/sonar-scanner
                    """
                }
            }
        }
}
