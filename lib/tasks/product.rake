namespace :all_products do
  task :create_category => :environment do
    10.times do
      Category.create(
        :name => Faker::Name.name
      )
    end
  end

  task :create_products => :environment do 
    10.times do
      Category.all.each do |category|
        category.products.create(
          :name => Faker::Name.name,
          price: 67
        )
      end
    end
  end
end