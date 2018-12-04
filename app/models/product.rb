class Product < ApplicationRecord
	belongs_to :company, optional: true, dependent: :destroy
	attr_accessor :company

	def self.company_name(id)
		Company.find(id)
	end

	def self.show_one_product(id)
		@product = {}
		@product[:product] = Product.find(id)
		@company = Company.find(@product[:product].companies_id)
		@product[:company] = @company.name

		return @product
	end
end
