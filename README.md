# Redmine

1. config/database.yml 파일 만들기
2. (rails 5.2.x 이상이면) config/credentials.yml.enc, config/master.key 파일 만들기
3. 으로 새 프로젝트를 만들고 **project/config/credentials.yml.enc** 와 **master.key** 복사해서 사용한다.
4. sudo bundle exec rake db:migrate RAILS_ENV=production
5. rails s(erver)