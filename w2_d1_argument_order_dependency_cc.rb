
# --------------------------- House for SALE ----------------------------

class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost, :has_tenants, :short_sale

  def initialize(info = {})
    @address = info[:address]
    @square_feet = info[:square_feet]
    @num_bedrooms = info[:num_bedrooms] || 3
    @num_baths = info[:num_baths] || 2
    @cost = info[:cost] || 320_000
    @down_payment = info[:down_payment] || 0.20
    @sold = info[:sold] || false
    @short_sale = info[:short_sale] || 5
    @has_tenants = info.fetch(:has_tenants, true)
    # @has_tenants = info.fetch(:has_tenants) {true}
    # @has_tenants = info[:has_tenants] || false
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

house_1 = House.new(:address => "3245 Temple St",
                    :square_feet => 2_500,
                    :num_bedrooms => 5,
                    :num_baths => 3,
                    :cost => 320_000,
                    :down_payment => 0.00,
                    :sold => false,
                    :has_tenants => false)

p house_1
p house_1.num_baths
p house_1.has_tenants
p house_1.short_sale
p house_1.to_s

# --------------------------- Herbie the Car ----------------------------
puts "---------------------"

class Car
  attr_reader :headlights, :gear

  def start_car(options = {})
    # @headlights = options[:headlights] || true
    @headlights = options.fetch(:headlights, true)
    @gear       = options[:gear] || 1
    @windows = options[:windows] || 3
  end
end

herbie = Car.new

# When we start the car, the headlights should be on by default:
p herbie.start_car
p herbie.headlights # => true

# But what happens when we want to start without headlights?
p herbie.start_car(headlights: false)
p herbie.headlights # => true  WHAT?!  (With the fetch used for headlight this is now corrected to false.)
