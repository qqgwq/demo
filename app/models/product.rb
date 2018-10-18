class Product < ActiveRecord::Base
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  has_ancestry
  enum gender: ["female", "male"]

  state_machine :state, initial: :pending do
    event :purchase do
      transition pending: :purchase
    end

    event :ship do
      transition purchase: :shipping
    end

    event :cancel do
      transition shipping: :canceled
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).products
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def category_name
    category.name
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) if name.present?
  end


  def self.cache_all
    Rails.cache.fetch('all_products', expires_in: 1.minutes) { Product.all.to_a }
  end

  def cache_category
    Rails.cache.fetch([self, "category"], expires_in: 1.minutes) { self.category.name }
  end

  def self.search(search)
    if search
      where('name like? or price like?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
