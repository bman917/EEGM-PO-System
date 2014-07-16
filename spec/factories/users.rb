FactoryGirl.define do
  factory :user do
    email {"#{username}@noreply.com"}

    factory :admin do
      username 'admin'
      password 'password'
    end

    factory :moderator do
      username 'moderator'
      password 'password'
    end
      
  end
end