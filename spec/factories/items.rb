FactoryBot.define do
  factory :item do
    image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'), 'image/png') }
    item_name {"name_test"}
    item_exposition{"exposition_test"}
    category_id {2}
    status_id{2}
    postage_id {2}
    shipping_id{2}
    price  {2000}
    day_id {2}
    association :user

    
  end
end
