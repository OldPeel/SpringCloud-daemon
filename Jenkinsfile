// git的凭证ID
def git_auth = "5f22344c-2779-4740-85d7-a7ed661df4ef"

// git的项目URL地址
def git_url = "git@gitlab.test.com:java_project/tensquare_back.git"
node {
stage('拉取代码') {
 	checkout([$class: 'GitSCM', branches: [[name: "*/${branch}"]], extensions: [], userRemoteConfigs: [[credentialsId: "${git_auth}", url: "${git_url}"]]])
	}

}
