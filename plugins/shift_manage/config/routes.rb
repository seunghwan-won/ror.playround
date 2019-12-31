# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# url 주소, 컨트롤러 이름 # 컨트롤러 메소드 이름
get 'check_in', :to => 'index#check_in'

get 'time', :to => 'time_log#index'
get 'time/create', :to => 'time_log#create'
get 'time/update', :to => 'time_log#update'
get 'time/delete', :to => 'time_log#delete'
