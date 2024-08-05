pipeline {
    agent {
        kubernetes {
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  name: jenkins
spec:
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
    - name: kube-config
      emptyDir: {}
  containers:
  - name: docker
    image: docker:latest
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  - name: kubectl
    image: riya299/my-kubectl-image:tagname
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /root/.kube
      name: kube-config
"""
        }
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/RIYAG09/kubectl-demo.git', branch: 'main'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                container('kubectl') {
                    script {
                
                        sh 'kubectl apply -f deployment.yaml'
                    }
                }
            }
        }
    }
}
