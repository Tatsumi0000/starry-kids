.PHONY: setup

# docker-compose.ymlに必要なイメージをビルド
# VueとRailsのライブラリをインストール
# Railsで必要なDBのセットアップ
.SILENT:
setup:  
			docker compose build ; \
			docker compose run --rm frontend /bin/bash -c "npm install" ; \
			docker compose run --rm backend /bin/bash -c "bundle install" ; \
			docker compose run --rm backend /bin/bash -c "bin/rails db:create" ; \
			echo "********************\n" ; \
			echo "docker compose up で開発環境を起動してください" ; \
			echo "\n********************"
