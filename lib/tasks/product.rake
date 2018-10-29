namespace :all_products do
  task all: [:create_category, :create_products, :create_product_image]
  task :create_category => :environment do
    10.times do
      Category.create(
        :name => Faker::Pokemon.name
      )
    end
  end

  task :create_products => :environment do 
    10.times do
      Category.all.each do |category|
        category.products.create(
          :name => Faker::Name.name,
          :remote_image_url => Faker::Avatar.image,
          price: 67
        )
      end
    end
  end

  task :create_product_image => :environment do
    10.times do
      Product.create!(
        :remote_image_url => Faker::Avatar.image
      )
    end
  end
end