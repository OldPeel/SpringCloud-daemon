// git的凭证ID
def git_auth = "5f22344c-2779-4740-85d7-a7ed661df4ef"

// git的项目URL地址
def git_url = "git@gitlab.test.com:java_project/tensquare_back.git"
node {
    stage('拉取代码') {
 	    checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], extensions: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
	}
/**
    stage('检测代码') {
                script {
                    //引入SonarqubeScanner工具
                    scannerHome = tool 'sonarqube-scanner'
                }
                //引入SonarQube的服务器环境
                withSonarQubeEnv('sonarqube') {
                    sh """
                        cd ${project_name}
                        ${scannerHome}/bin/sonar-scanner
                    """
                }
        }
        */
    // 编译安装子工程至本地Maven仓库，其他微服务组件需要依赖于子工程，如无子工程其他组件也无法进行编译
    stage('编译&安装子工程') {
                sh "mvn -f tensquare_common clean install"
        }
    //编译并打包微服务组件
    stage('编译&打包微服务工程') {
                echo "${project_name}"
                sh "mvn -f '${project_name}' clean package"
        }
}
