FactoryGirl.define do

  factory :item do
    name         {generate(:name)}
    description  {generate(:last_name)}
    image_url    {generate(:image_url)}
  end

  sequence :name do |n|
    "Name-#{n}"
  end

  sequence :description do |n|
    "Description-#{n}"
  end

  sequence :image_url do |n|
    Faker::Internet.url
  end

end
