# docker-knowledge
Docker file for knowledge

- Dockerで、[Knowledge](https://github.com/support-project/knowledge) の環境を構築できるDockerfileです
- Dockerの環境があれば、お手軽にKnowledgeの環境が構築できます

## Build

以下のコマンドでイメージを作成できます。

    docker build -t knowledge:1.3.1 .

## Run

以下のコマンドでコンテナを起動してください。

    mkdir /home/hoge/knowledge
    chmod a+w /home/hoge/knowledge
    docker run -d -p 80:8080 -v /home/hoge/knowledge:/root/.knowledge knowledge:1.3.1

コンテナの停止時には、管理メニューからDBをまず停止するようにしてください。
