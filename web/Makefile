.PHONY: setup

# 必要なライブラリをインストールして
# DBのセットアップをする
setup:  
			docker compose run --rm backend /bin/bash -c "bundle install" ; \
			docker compose run --rm backend /bin/bash -c "bin/rails db:create"
