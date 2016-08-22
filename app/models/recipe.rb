class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients)
    ingredients.each do |ing|
      if ing[1]["name"]!=""
        self.ingredients<<Ingredient.create(name:ing[1]["name"], quantity:ing[1]["quantity"])
      end
    end
  end

end
